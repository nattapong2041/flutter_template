// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginServiceRequest _$LoginServiceRequestFromJson(Map<String, dynamic> json) {
  return _LoginServiceRequest.fromJson(json);
}

/// @nodoc
mixin _$LoginServiceRequest {
  String get Username => throw _privateConstructorUsedError;
  String get Password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginServiceRequestCopyWith<LoginServiceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginServiceRequestCopyWith<$Res> {
  factory $LoginServiceRequestCopyWith(
          LoginServiceRequest value, $Res Function(LoginServiceRequest) then) =
      _$LoginServiceRequestCopyWithImpl<$Res, LoginServiceRequest>;
  @useResult
  $Res call({String Username, String Password});
}

/// @nodoc
class _$LoginServiceRequestCopyWithImpl<$Res, $Val extends LoginServiceRequest>
    implements $LoginServiceRequestCopyWith<$Res> {
  _$LoginServiceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Username = null,
    Object? Password = null,
  }) {
    return _then(_value.copyWith(
      Username: null == Username
          ? _value.Username
          : Username // ignore: cast_nullable_to_non_nullable
              as String,
      Password: null == Password
          ? _value.Password
          : Password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginServiceRequestCopyWith<$Res>
    implements $LoginServiceRequestCopyWith<$Res> {
  factory _$$_LoginServiceRequestCopyWith(_$_LoginServiceRequest value,
          $Res Function(_$_LoginServiceRequest) then) =
      __$$_LoginServiceRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String Username, String Password});
}

/// @nodoc
class __$$_LoginServiceRequestCopyWithImpl<$Res>
    extends _$LoginServiceRequestCopyWithImpl<$Res, _$_LoginServiceRequest>
    implements _$$_LoginServiceRequestCopyWith<$Res> {
  __$$_LoginServiceRequestCopyWithImpl(_$_LoginServiceRequest _value,
      $Res Function(_$_LoginServiceRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Username = null,
    Object? Password = null,
  }) {
    return _then(_$_LoginServiceRequest(
      Username: null == Username
          ? _value.Username
          : Username // ignore: cast_nullable_to_non_nullable
              as String,
      Password: null == Password
          ? _value.Password
          : Password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginServiceRequest
    with DiagnosticableTreeMixin
    implements _LoginServiceRequest {
  const _$_LoginServiceRequest(
      {required this.Username, required this.Password});

  factory _$_LoginServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$$_LoginServiceRequestFromJson(json);

  @override
  final String Username;
  @override
  final String Password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginServiceRequest(Username: $Username, Password: $Password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginServiceRequest'))
      ..add(DiagnosticsProperty('Username', Username))
      ..add(DiagnosticsProperty('Password', Password));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginServiceRequest &&
            (identical(other.Username, Username) ||
                other.Username == Username) &&
            (identical(other.Password, Password) ||
                other.Password == Password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, Username, Password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginServiceRequestCopyWith<_$_LoginServiceRequest> get copyWith =>
      __$$_LoginServiceRequestCopyWithImpl<_$_LoginServiceRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginServiceRequestToJson(
      this,
    );
  }
}

abstract class _LoginServiceRequest implements LoginServiceRequest {
  const factory _LoginServiceRequest(
      {required final String Username,
      required final String Password}) = _$_LoginServiceRequest;

  factory _LoginServiceRequest.fromJson(Map<String, dynamic> json) =
      _$_LoginServiceRequest.fromJson;

  @override
  String get Username;
  @override
  String get Password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginServiceRequestCopyWith<_$_LoginServiceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginServiceResponse _$LoginServiceResponseFromJson(Map<String, dynamic> json) {
  return _LoginServiceResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginServiceResponse {
  int? get result => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool? get token => throw _privateConstructorUsedError;
  int? get loginProvider => throw _privateConstructorUsedError;
  String? get detail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginServiceResponseCopyWith<LoginServiceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginServiceResponseCopyWith<$Res> {
  factory $LoginServiceResponseCopyWith(LoginServiceResponse value,
          $Res Function(LoginServiceResponse) then) =
      _$LoginServiceResponseCopyWithImpl<$Res, LoginServiceResponse>;
  @useResult
  $Res call(
      {int? result,
      String? message,
      bool? token,
      int? loginProvider,
      String? detail});
}

/// @nodoc
class _$LoginServiceResponseCopyWithImpl<$Res,
        $Val extends LoginServiceResponse>
    implements $LoginServiceResponseCopyWith<$Res> {
  _$LoginServiceResponseCopyWithImpl(this._value, this._then);

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
    Object? detail = freezed,
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
              as bool?,
      loginProvider: freezed == loginProvider
          ? _value.loginProvider
          : loginProvider // ignore: cast_nullable_to_non_nullable
              as int?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginServiceResponseCopyWith<$Res>
    implements $LoginServiceResponseCopyWith<$Res> {
  factory _$$_LoginServiceResponseCopyWith(_$_LoginServiceResponse value,
          $Res Function(_$_LoginServiceResponse) then) =
      __$$_LoginServiceResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? result,
      String? message,
      bool? token,
      int? loginProvider,
      String? detail});
}

/// @nodoc
class __$$_LoginServiceResponseCopyWithImpl<$Res>
    extends _$LoginServiceResponseCopyWithImpl<$Res, _$_LoginServiceResponse>
    implements _$$_LoginServiceResponseCopyWith<$Res> {
  __$$_LoginServiceResponseCopyWithImpl(_$_LoginServiceResponse _value,
      $Res Function(_$_LoginServiceResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? message = freezed,
    Object? token = freezed,
    Object? loginProvider = freezed,
    Object? detail = freezed,
  }) {
    return _then(_$_LoginServiceResponse(
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
              as bool?,
      loginProvider: freezed == loginProvider
          ? _value.loginProvider
          : loginProvider // ignore: cast_nullable_to_non_nullable
              as int?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginServiceResponse
    with DiagnosticableTreeMixin
    implements _LoginServiceResponse {
  const _$_LoginServiceResponse(
      {this.result, this.message, this.token, this.loginProvider, this.detail});

  factory _$_LoginServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$$_LoginServiceResponseFromJson(json);

  @override
  final int? result;
  @override
  final String? message;
  @override
  final bool? token;
  @override
  final int? loginProvider;
  @override
  final String? detail;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginServiceResponse(result: $result, message: $message, token: $token, loginProvider: $loginProvider, detail: $detail)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginServiceResponse'))
      ..add(DiagnosticsProperty('result', result))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('loginProvider', loginProvider))
      ..add(DiagnosticsProperty('detail', detail));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginServiceResponse &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.loginProvider, loginProvider) ||
                other.loginProvider == loginProvider) &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, result, message, token, loginProvider, detail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginServiceResponseCopyWith<_$_LoginServiceResponse> get copyWith =>
      __$$_LoginServiceResponseCopyWithImpl<_$_LoginServiceResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginServiceResponseToJson(
      this,
    );
  }
}

abstract class _LoginServiceResponse implements LoginServiceResponse {
  const factory _LoginServiceResponse(
      {final int? result,
      final String? message,
      final bool? token,
      final int? loginProvider,
      final String? detail}) = _$_LoginServiceResponse;

  factory _LoginServiceResponse.fromJson(Map<String, dynamic> json) =
      _$_LoginServiceResponse.fromJson;

  @override
  int? get result;
  @override
  String? get message;
  @override
  bool? get token;
  @override
  int? get loginProvider;
  @override
  String? get detail;
  @override
  @JsonKey(ignore: true)
  _$$_LoginServiceResponseCopyWith<_$_LoginServiceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
