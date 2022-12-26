// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginServiceRequest _$LoginServiceRequestFromJson(Map<String, dynamic> json) =>
    LoginServiceRequest(
      username: json['Username'] as String,
      password: json['Password'] as String,
    );

Map<String, dynamic> _$LoginServiceRequestToJson(
        LoginServiceRequest instance) =>
    <String, dynamic>{
      'Username': instance.username,
      'Password': instance.password,
    };

LoginServiceResponse _$LoginServiceResponseFromJson(
        Map<String, dynamic> json) =>
    LoginServiceResponse(
      json['detail'] as String?,
    )
      ..result = json['result'] as int?
      ..message = json['message'] as String?
      ..token = json['token'] as bool?
      ..loginProvider = json['loginProvider'] as int?;

Map<String, dynamic> _$LoginServiceResponseToJson(
        LoginServiceResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'token': instance.token,
      'loginProvider': instance.loginProvider,
      'detail': instance.detail,
    };
