// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BaseRequest _$$_BaseRequestFromJson(Map<String, dynamic> json) =>
    _$_BaseRequest(
      service: json['service'] as String,
    );

Map<String, dynamic> _$$_BaseRequestToJson(_$_BaseRequest instance) =>
    <String, dynamic>{
      'service': instance.service,
    };

_$_BaseResponse _$$_BaseResponseFromJson(Map<String, dynamic> json) =>
    _$_BaseResponse(
      result: json['result'] as int?,
      message: json['message'] as String?,
      token: json['token'] as String?,
      loginProvider: json['loginProvider'] as int?,
    );

Map<String, dynamic> _$$_BaseResponseToJson(_$_BaseResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'token': instance.token,
      'loginProvider': instance.loginProvider,
    };
