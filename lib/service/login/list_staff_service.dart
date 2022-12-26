import 'dart:convert';
import 'dart:developer';

import 'package:flutter_template/base/base_service.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../base/base_model.dart';

part 'list_staff_service.g.dart';

class ListStaffService extends BaseService {
  Future<ListStaffServiceResponse> callService(
      ListStaffServiceRequest request) {
    log('exceute service: ${request.service}');
    return execute(ServiceUrl.listStaff,
            unencodePath: '/${request.userId}',
            urlType: UrlType.urlWithUnencodePath,
            request: request.toJson(),
            method: HttpMethod.get,
            needAuth: false)
        .then((resp) {
      return ListStaffServiceResponse.fromJson(jsonDecode(resp));
    });
  }
}

@JsonSerializable()
class ListStaffServiceRequest extends BaseRequest {
  ListStaffServiceRequest({this.userId, required this.searchKey})
      : super(service: "ListStaffServiceRequest");

  @JsonKey(ignore: true)
  String? userId;

  @JsonKey(name: 'search')
  String searchKey;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory ListStaffServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$ListStaffServiceRequestFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ListStaffServiceRequestToJson(this);
}

@JsonSerializable()
class ListStaffServiceResponse extends BaseResponse {
  ListStaffServiceResponse(this.detail);

  @JsonKey(name: 'detail')
  ListStaffResult? detail;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory ListStaffServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListStaffServiceResponseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ListStaffServiceResponseToJson(this);
}

@JsonSerializable()
class ListStaffResult {
  ListStaffResult(this.resutl);

  @JsonKey(name: 'result')
  List<ListStaff>? resutl;

  factory ListStaffResult.fromJson(Map<String, dynamic> json) =>
      _$ListStaffResultFromJson(json);

  Map<String, dynamic> toJson() => _$ListStaffResultToJson(this);
}

@JsonSerializable()
class ListStaff {
  ListStaff(this.id, this.staffNo, this.gender, this.firstName, this.lastName,
      this.isActive);

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'staffNo')
  String? staffNo;

  @JsonKey(name: 'gender')
  String? gender;

  @JsonKey(name: 'firstName')
  String? firstName;

  @JsonKey(name: 'lastName')
  String? lastName;

  @JsonKey(name: 'isActive')
  int? isActive;

  factory ListStaff.fromJson(Map<String, dynamic> json) =>
      _$ListStaffFromJson(json);

  Map<String, dynamic> toJson() => _$ListStaffToJson(this);
}
