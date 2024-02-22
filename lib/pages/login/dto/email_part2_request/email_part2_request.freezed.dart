// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_part2_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmailPart2Request _$EmailPart2RequestFromJson(Map<String, dynamic> json) {
  return _EmailPart2Request.fromJson(json);
}

/// @nodoc
mixin _$EmailPart2Request {
  String? get email => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailPart2RequestCopyWith<EmailPart2Request> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailPart2RequestCopyWith<$Res> {
  factory $EmailPart2RequestCopyWith(
          EmailPart2Request value, $Res Function(EmailPart2Request) then) =
      _$EmailPart2RequestCopyWithImpl<$Res, EmailPart2Request>;
  @useResult
  $Res call({String? email, String? code});
}

/// @nodoc
class _$EmailPart2RequestCopyWithImpl<$Res, $Val extends EmailPart2Request>
    implements $EmailPart2RequestCopyWith<$Res> {
  _$EmailPart2RequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmailPart2RequestImplCopyWith<$Res>
    implements $EmailPart2RequestCopyWith<$Res> {
  factory _$$EmailPart2RequestImplCopyWith(_$EmailPart2RequestImpl value,
          $Res Function(_$EmailPart2RequestImpl) then) =
      __$$EmailPart2RequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? email, String? code});
}

/// @nodoc
class __$$EmailPart2RequestImplCopyWithImpl<$Res>
    extends _$EmailPart2RequestCopyWithImpl<$Res, _$EmailPart2RequestImpl>
    implements _$$EmailPart2RequestImplCopyWith<$Res> {
  __$$EmailPart2RequestImplCopyWithImpl(_$EmailPart2RequestImpl _value,
      $Res Function(_$EmailPart2RequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? code = freezed,
  }) {
    return _then(_$EmailPart2RequestImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailPart2RequestImpl implements _EmailPart2Request {
  const _$EmailPart2RequestImpl({this.email, this.code});

  factory _$EmailPart2RequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailPart2RequestImplFromJson(json);

  @override
  final String? email;
  @override
  final String? code;

  @override
  String toString() {
    return 'EmailPart2Request(email: $email, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailPart2RequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailPart2RequestImplCopyWith<_$EmailPart2RequestImpl> get copyWith =>
      __$$EmailPart2RequestImplCopyWithImpl<_$EmailPart2RequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailPart2RequestImplToJson(
      this,
    );
  }
}

abstract class _EmailPart2Request implements EmailPart2Request {
  const factory _EmailPart2Request({final String? email, final String? code}) =
      _$EmailPart2RequestImpl;

  factory _EmailPart2Request.fromJson(Map<String, dynamic> json) =
      _$EmailPart2RequestImpl.fromJson;

  @override
  String? get email;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$EmailPart2RequestImplCopyWith<_$EmailPart2RequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
