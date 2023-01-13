import 'dart:convert';
import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';

import '../../base/base_model.dart';
import '../../base/base_service.dart';

part 'login_service.g.dart';

class LoginService extends BaseService {
  Future<LoginServiceResponse> callService(LoginServiceRequest request) {
    log('execute service: ${request.service}');
    return execute(ServiceUrl.login,
            request: request.toJson(), method: HttpMethod.post, needAuth: false)
        .then((resp) {
      return LoginServiceResponse.fromJson(jsonDecode(resp));
    });
  }
}

@JsonSerializable()
class LoginServiceRequest extends BaseRequest {
  LoginServiceRequest({required this.username, required this.password})
      : super(service: "LoginServiceRequest");

  @JsonKey(name: 'Username')
  String username;

  @JsonKey(name: 'Password')
  String password;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory LoginServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginServiceRequestFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$LoginServiceRequestToJson(this);
}

@JsonSerializable()
class LoginServiceResponse extends BaseResponse {
  LoginServiceResponse(this.detail);

  @JsonKey(name: 'detail')
  String? detail;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory LoginServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginServiceResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$LoginServiceResponseToJson(this);
}
