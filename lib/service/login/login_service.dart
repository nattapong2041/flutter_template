// This file is "base_model.dart"
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_template/base/base_service.dart';

part 'login_service.freezed.dart';
part 'login_service.g.dart';

class LoginService extends BaseService {
  Future<LoginServiceResponse> callService(LoginServiceRequest request) {
    return execute(ServiceUrl.login, request.toJson(), HttpMethod.post,
            needAuth: false)
        .then((resp) {
      return LoginServiceResponse.fromJson(jsonDecode(resp));
    });
  }
}

@freezed
class LoginServiceRequest with _$LoginServiceRequest {
  const factory LoginServiceRequest({
    required String Username,
    required String Password,
  }) = _LoginServiceRequest;

  factory LoginServiceRequest.fromJson(Map<String, Object?> json) =>
      _$LoginServiceRequestFromJson(json);
}

@freezed
class LoginServiceResponse with _$LoginServiceResponse {
  const factory LoginServiceResponse({
    int? result,
    String? message,
    bool? token,
    int? loginProvider,
    String? detail,
  }) = _LoginServiceResponse;

  factory LoginServiceResponse.fromJson(Map<String, Object?> json) =>
      _$LoginServiceResponseFromJson(json);
}
