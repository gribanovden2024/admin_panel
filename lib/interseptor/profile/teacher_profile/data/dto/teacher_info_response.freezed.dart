// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_info_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TeacherInfoResponse _$TeacherInfoResponseFromJson(Map<String, dynamic> json) {
  return _TeacherInfoResponse.fromJson(json);
}

/// @nodoc
mixin _$TeacherInfoResponse {
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'middlename')
  String? get middlename => throw _privateConstructorUsedError;
  String? get rank => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_name')
  String? get departmentName => throw _privateConstructorUsedError;
  String? get faculty => throw _privateConstructorUsedError;
  @JsonKey(name: 'accept_politic')
  bool? get acceptPolitic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeacherInfoResponseCopyWith<TeacherInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherInfoResponseCopyWith<$Res> {
  factory $TeacherInfoResponseCopyWith(
          TeacherInfoResponse value, $Res Function(TeacherInfoResponse) then) =
      _$TeacherInfoResponseCopyWithImpl<$Res, TeacherInfoResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'middlename') String? middlename,
      String? rank,
      @JsonKey(name: 'department_name') String? departmentName,
      String? faculty,
      @JsonKey(name: 'accept_politic') bool? acceptPolitic});
}

/// @nodoc
class _$TeacherInfoResponseCopyWithImpl<$Res, $Val extends TeacherInfoResponse>
    implements $TeacherInfoResponseCopyWith<$Res> {
  _$TeacherInfoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middlename = freezed,
    Object? rank = freezed,
    Object? departmentName = freezed,
    Object? faculty = freezed,
    Object? acceptPolitic = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      middlename: freezed == middlename
          ? _value.middlename
          : middlename // ignore: cast_nullable_to_non_nullable
              as String?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      faculty: freezed == faculty
          ? _value.faculty
          : faculty // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptPolitic: freezed == acceptPolitic
          ? _value.acceptPolitic
          : acceptPolitic // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeacherInfoResponseImplCopyWith<$Res>
    implements $TeacherInfoResponseCopyWith<$Res> {
  factory _$$TeacherInfoResponseImplCopyWith(_$TeacherInfoResponseImpl value,
          $Res Function(_$TeacherInfoResponseImpl) then) =
      __$$TeacherInfoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'middlename') String? middlename,
      String? rank,
      @JsonKey(name: 'department_name') String? departmentName,
      String? faculty,
      @JsonKey(name: 'accept_politic') bool? acceptPolitic});
}

/// @nodoc
class __$$TeacherInfoResponseImplCopyWithImpl<$Res>
    extends _$TeacherInfoResponseCopyWithImpl<$Res, _$TeacherInfoResponseImpl>
    implements _$$TeacherInfoResponseImplCopyWith<$Res> {
  __$$TeacherInfoResponseImplCopyWithImpl(_$TeacherInfoResponseImpl _value,
      $Res Function(_$TeacherInfoResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middlename = freezed,
    Object? rank = freezed,
    Object? departmentName = freezed,
    Object? faculty = freezed,
    Object? acceptPolitic = freezed,
  }) {
    return _then(_$TeacherInfoResponseImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      middlename: freezed == middlename
          ? _value.middlename
          : middlename // ignore: cast_nullable_to_non_nullable
              as String?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String?,
      departmentName: freezed == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      faculty: freezed == faculty
          ? _value.faculty
          : faculty // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptPolitic: freezed == acceptPolitic
          ? _value.acceptPolitic
          : acceptPolitic // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherInfoResponseImpl implements _TeacherInfoResponse {
  const _$TeacherInfoResponseImpl(
      {@JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'middlename') this.middlename,
      this.rank,
      @JsonKey(name: 'department_name') this.departmentName,
      this.faculty,
      @JsonKey(name: 'accept_politic') this.acceptPolitic});

  factory _$TeacherInfoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherInfoResponseImplFromJson(json);

  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'middlename')
  final String? middlename;
  @override
  final String? rank;
  @override
  @JsonKey(name: 'department_name')
  final String? departmentName;
  @override
  final String? faculty;
  @override
  @JsonKey(name: 'accept_politic')
  final bool? acceptPolitic;

  @override
  String toString() {
    return 'TeacherInfoResponse(firstName: $firstName, lastName: $lastName, middlename: $middlename, rank: $rank, departmentName: $departmentName, faculty: $faculty, acceptPolitic: $acceptPolitic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherInfoResponseImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.middlename, middlename) ||
                other.middlename == middlename) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.faculty, faculty) || other.faculty == faculty) &&
            (identical(other.acceptPolitic, acceptPolitic) ||
                other.acceptPolitic == acceptPolitic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, middlename,
      rank, departmentName, faculty, acceptPolitic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherInfoResponseImplCopyWith<_$TeacherInfoResponseImpl> get copyWith =>
      __$$TeacherInfoResponseImplCopyWithImpl<_$TeacherInfoResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherInfoResponseImplToJson(
      this,
    );
  }
}

abstract class _TeacherInfoResponse implements TeacherInfoResponse {
  const factory _TeacherInfoResponse(
          {@JsonKey(name: 'first_name') final String? firstName,
          @JsonKey(name: 'last_name') final String? lastName,
          @JsonKey(name: 'middlename') final String? middlename,
          final String? rank,
          @JsonKey(name: 'department_name') final String? departmentName,
          final String? faculty,
          @JsonKey(name: 'accept_politic') final bool? acceptPolitic}) =
      _$TeacherInfoResponseImpl;

  factory _TeacherInfoResponse.fromJson(Map<String, dynamic> json) =
      _$TeacherInfoResponseImpl.fromJson;

  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'middlename')
  String? get middlename;
  @override
  String? get rank;
  @override
  @JsonKey(name: 'department_name')
  String? get departmentName;
  @override
  String? get faculty;
  @override
  @JsonKey(name: 'accept_politic')
  bool? get acceptPolitic;
  @override
  @JsonKey(ignore: true)
  _$$TeacherInfoResponseImplCopyWith<_$TeacherInfoResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
