// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginServiceRequest _$$_LoginServiceRequestFromJson(
        Map<String, dynamic> json) =>
    _$_LoginServiceRequest(
      Username: json['Username'] as String,
      Password: json['Password'] as String,
    );

Map<String, dynamic> _$$_LoginServiceRequestToJson(
        _$_LoginServiceRequest instance) =>
    <String, dynamic>{
      'Username': instance.Username,
      'Password': instance.Password,
    };

_$_LoginServiceResponse _$$_LoginServiceResponseFromJson(
        Map<String, dynamic> json) =>
    _$_LoginServiceResponse(
      result: json['result'] as int?,
      message: json['message'] as String?,
      token: json['token'] as bool?,
      loginProvider: json['loginProvider'] as int?,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$$_LoginServiceResponseToJson(
        _$_LoginServiceResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'token': instance.token,
      'loginProvider': instance.loginProvider,
      'detail': instance.detail,
    };
