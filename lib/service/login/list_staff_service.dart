import 'dart:convert';
import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';

import '../../base/api_exception.dart';
import '../../base/base_model.dart';
import '../../base/base_service.dart';

part 'list_staff_service.g.dart';

class ListStaffService extends BaseService {
  Future<ListStaffServiceResponse> callService(
      ListStaffServiceRequest request) {
    log('execute service: ${request.service}');
    return execute(ServiceUrl.listStaff,
            unencodePath: '/${request.userId}',
            urlType: UrlType.urlWithUnencodePath,
            request: request.toJson(),
            method: HttpMethod.get,
            needAuth: true)
        .then((resp) {
      return ListStaffServiceResponse.fromJson(jsonDecode(resp));
    }).catchError((onError) {
      if (onError is ApiException) {
        throw onError;
      } else {
        log(onError);
        throw Exception("Error ${request.service}");
      }
    });
  }
}

@JsonSerializable()
class ListStaffServiceRequest extends BaseRequest {
  ListStaffServiceRequest({this.userId, this.searchKey})
      : super(service: "ListStaffServiceRequest");

  @JsonKey(includeFromJson: false, includeToJson: false)
  String? userId;

  @JsonKey(name: 'search', includeIfNull: false)
  String? searchKey;

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
  ListStaffResult(this.listStaff);

  @JsonKey(name: 'result')
  List<Staff>? listStaff;

  factory ListStaffResult.fromJson(Map<String, dynamic> json) =>
      _$ListStaffResultFromJson(json);

  Map<String, dynamic> toJson() => _$ListStaffResultToJson(this);
}

@JsonSerializable()
class Staff {
  Staff(this.id, this.staffNo, this.gender, this.firstName, this.lastName,
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

  factory Staff.fromJson(Map<String, dynamic> json) => _$StaffFromJson(json);

  Map<String, dynamic> toJson() => _$StaffToJson(this);
}
