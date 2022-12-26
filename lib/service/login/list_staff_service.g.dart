// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_staff_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListStaffServiceRequest _$ListStaffServiceRequestFromJson(
        Map<String, dynamic> json) =>
    ListStaffServiceRequest(
      searchKey: json['search'] as String,
    );

Map<String, dynamic> _$ListStaffServiceRequestToJson(
        ListStaffServiceRequest instance) =>
    <String, dynamic>{
      'search': instance.searchKey,
    };

ListStaffServiceResponse _$ListStaffServiceResponseFromJson(
        Map<String, dynamic> json) =>
    ListStaffServiceResponse(
      json['detail'] == null
          ? null
          : ListStaffResult.fromJson(json['detail'] as Map<String, dynamic>),
    )
      ..result = json['result'] as int?
      ..message = json['message'] as String?
      ..token = json['token'] as bool?
      ..loginProvider = json['loginProvider'] as int?;

Map<String, dynamic> _$ListStaffServiceResponseToJson(
        ListStaffServiceResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'message': instance.message,
      'token': instance.token,
      'loginProvider': instance.loginProvider,
      'detail': instance.detail,
    };

ListStaffResult _$ListStaffResultFromJson(Map<String, dynamic> json) =>
    ListStaffResult(
      (json['result'] as List<dynamic>?)
          ?.map((e) => ListStaff.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListStaffResultToJson(ListStaffResult instance) =>
    <String, dynamic>{
      'result': instance.resutl,
    };

ListStaff _$ListStaffFromJson(Map<String, dynamic> json) => ListStaff(
      json['id'] as int?,
      json['staffNo'] as String?,
      json['gender'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['isActive'] as int?,
    );

Map<String, dynamic> _$ListStaffToJson(ListStaff instance) => <String, dynamic>{
      'id': instance.id,
      'staffNo': instance.staffNo,
      'gender': instance.gender,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'isActive': instance.isActive,
    };
