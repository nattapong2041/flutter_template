// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BaseRequest _$BaseRequestFromJson(Map<String, dynamic> json) {
  return _BaseRequest.fromJson(json);
}

/// @nodoc
mixin _$BaseRequest {
  String get service => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseRequestCopyWith<BaseRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseRequestCopyWith<$Res> {
  factory $BaseRequestCopyWith(
          BaseRequest value, $Res Function(BaseRequest) then) =
      _$BaseRequestCopyWithImpl<$Res, BaseRequest>;
  @useResult
  $Res call({String service});
}

/// @nodoc
class _$BaseRequestCopyWithImpl<$Res, $Val extends BaseRequest>
    implements $BaseRequestCopyWith<$Res> {
  _$BaseRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
  }) {
    return _then(_value.copyWith(
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BaseRequestCopyWith<$Res>
    implements $BaseRequestCopyWith<$Res> {
  factory _$$_BaseRequestCopyWith(
          _$_BaseRequest value, $Res Function(_$_BaseRequest) then) =
      __$$_BaseRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String service});
}

/// @nodoc
class __$$_BaseRequestCopyWithImpl<$Res>
    extends _$BaseRequestCopyWithImpl<$Res, _$_BaseRequest>
    implements _$$_BaseRequestCopyWith<$Res> {
  __$$_BaseRequestCopyWithImpl(
      _$_BaseRequest _value, $Res Function(_$_BaseRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
  }) {
    return _then(_$_BaseRequest(
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BaseRequest with DiagnosticableTreeMixin implements _BaseRequest {
  const _$_BaseRequest({required this.service});

  factory _$_BaseRequest.fromJson(Map<String, dynamic> json) =>
      _$$_BaseRequestFromJson(json);

  @override
  final String service;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BaseRequest(service: $service)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BaseRequest'))
      ..add(DiagnosticsProperty('service', service));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BaseRequest &&
            (identical(other.service, service) || other.service == service));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, service);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BaseRequestCopyWith<_$_BaseRequest> get copyWith =>
      __$$_BaseRequestCopyWithImpl<_$_BaseRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BaseRequestToJson(
      this,
    );
  }
}

abstract class _BaseRequest implements BaseRequest {
  const factory _BaseRequest({required final String service}) = _$_BaseRequest;

  factory _BaseRequest.fromJson(Map<String, dynamic> json) =
      _$_BaseRequest.fromJson;

  @override
  String get service;
  @override
  @JsonKey(ignore: true)
  _$$_BaseRequestCopyWith<_$_BaseRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return _BaseResponse.fromJson(json);
}

/// @nodoc
mixin _$BaseResponse {
  int? get result => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  int? get loginProvider => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseResponseCopyWith<BaseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseResponseCopyWith<$Res> {
  factory $BaseResponseCopyWith(
          BaseResponse value, $Res Function(BaseResponse) then) =
      _$BaseResponseCopyWithImpl<$Res, BaseResponse>;
  @useResult
  $Res call({int? result, String? message, String? token, int? loginProvider});
}

/// @nodoc
class _$BaseResponseCopyWithImpl<$Res, $Val extends BaseResponse>
    implements $BaseResponseCopyWith<$Res> {
  _$BaseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? message = freezed,
    Object? token = freezed,
    Object? loginProvider = freezed,
  }) {
    return _then(_value.copyWith(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      loginProvider: freezed == loginProvider
          ? _value.loginProvider
          : loginProvider // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BaseResponseCopyWith<$Res>
    implements $BaseResponseCopyWith<$Res> {
  factory _$$_BaseResponseCopyWith(
          _$_BaseResponse value, $Res Function(_$_BaseResponse) then) =
      __$$_BaseResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? result, String? message, String? token, int? loginProvider});
}

/// @nodoc
class __$$_BaseResponseCopyWithImpl<$Res>
    extends _$BaseResponseCopyWithImpl<$Res, _$_BaseResponse>
    implements _$$_BaseResponseCopyWith<$Res> {
  __$$_BaseResponseCopyWithImpl(
      _$_BaseResponse _value, $Res Function(_$_BaseResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? message = freezed,
    Object? token = freezed,
    Object? loginProvider = freezed,
  }) {
    return _then(_$_BaseResponse(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      loginProvider: freezed == loginProvider
          ? _value.loginProvider
          : loginProvider // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BaseResponse with DiagnosticableTreeMixin implements _BaseResponse {
  const _$_BaseResponse(
      {this.result, this.message, this.token, this.loginProvider});

  factory _$_BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BaseResponseFromJson(json);

  @override
  final int? result;
  @override
  final String? message;
  @override
  final String? token;
  @override
  final int? loginProvider;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BaseResponse(result: $result, message: $message, token: $token, loginProvider: $loginProvider)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BaseResponse'))
      ..add(DiagnosticsProperty('result', result))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('loginProvider', loginProvider));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BaseResponse &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.loginProvider, loginProvider) ||
                other.loginProvider == loginProvider));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, result, message, token, loginProvider);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BaseResponseCopyWith<_$_BaseResponse> get copyWith =>
      __$$_BaseResponseCopyWithImpl<_$_BaseResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BaseResponseToJson(
      this,
    );
  }
}

abstract class _BaseResponse implements BaseResponse {
  const factory _BaseResponse(
      {final int? result,
      final String? message,
      final String? token,
      final int? loginProvider}) = _$_BaseResponse;

  factory _BaseResponse.fromJson(Map<String, dynamic> json) =
      _$_BaseResponse.fromJson;

  @override
  int? get result;
  @override
  String? get message;
  @override
  String? get token;
  @override
  int? get loginProvider;
  @override
  @JsonKey(ignore: true)
  _$$_BaseResponseCopyWith<_$_BaseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
