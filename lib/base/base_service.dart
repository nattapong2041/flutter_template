import 'dart:convert';
import 'dart:developer';

import 'package:flutter_template/common/config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

enum HttpMethod { post, get }

enum ServiceUrl {
  login,
}

extension AppUrl on ServiceUrl {
  String get fullUrl {
    switch (this) {
      case ServiceUrl.login:
        return "/account/login";
      default:
        return toString();
    }
  }
}

class AppService {
  //use witg config api path
  static String getUrl(ServiceUrl url) {
    return Config.apiService + url.fullUrl;
  }

  //other paths that not set in config
  static String getAbsoluteUrl(ServiceUrl url) {
    return url.fullUrl;
  }
}

class BaseService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final Map<String, String> _header = {
    "Accept": "application/json",
    "content-type": "application/json",
    'API-KEY': Config.apiKey,
  };

  Future<String> execute(
      ServiceUrl url, Map<String, dynamic> request, HttpMethod method,
      {bool needAuth = true}) async {
    String finalUrl = AppService.getUrl(url);
    try {
      var response = await _executeRequest(finalUrl, request, method,
          header: _header, needAuth: needAuth);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> _executeRequest(
      String url, Map<String, dynamic> request, HttpMethod method,
      {Map<String, String>? header, bool needAuth = true}) async {
    var client = needAuth
        ? AuthClient(getAccessToken: () async {
            return _prefs.then((value) => value.getString('token'));
          })
        : http.Client();
    try {
      if (method == HttpMethod.get) {
        log("********** http get **********");
        var queryString = _generateQueryString(request);
        log("queryString: $queryString");
        log("header: $header");
        log("final url: $url?$queryString");
        var response =
            await client.get(Uri.parse('$url?$queryString'), headers: header);
        return response;
      } else {
        log("********** http post **********");
        // log("request : " + request.toString());
        request.removeWhere((key, value) {
          return value == null;
        });
        log("header : $header");
        log("request body: ${jsonEncode(request)}");
        log("url: $url");
        var response = await client.post(Uri.parse(url),
            headers: header, body: jsonEncode(request));
        return response;
      }
    } catch (e) {
      rethrow;
    } finally {
      client.close();
    }
  }

  String _generateQueryString(Map<String, dynamic> request) {
    log("request ${request.toString()}");
    String result = "";
    request.forEach((key, value) {
      log("$key , $value");
      if (value != null) {
        result += "$key=$value";
        result += "&";
      }
    });
    result = result.substring(0, result.length - 1);
    log("result ${result.toString()}");
    return result;
  }
}

typedef GetAccessToken = Future<String?> Function();

class AuthClient extends http.BaseClient {
  AuthClient({
    required this.getAccessToken,
  });

  final _client = http.Client();
  final GetAccessToken getAccessToken;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    if (request.headers['authorization'] == null) {
      // add authorization header if it isn't exists
      final accessToken = await getAccessToken();
      if (accessToken != null) {
        request.headers['authorization'] = 'Bearer $accessToken';
      }
    }

    return _client.send(request);
  }

  @override
  void close() {
    _client.close();

    super.close();
  }
}
