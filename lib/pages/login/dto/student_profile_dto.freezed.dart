// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudentProfileDto _$StudentProfileDtoFromJson(Map<String, dynamic> json) {
  return _StudentProfileDto.fromJson(json);
}

/// @nodoc
mixin _$StudentProfileDto {
  @JsonKey(name: 'sub_group')
  int? get subGroup => throw _privateConstructorUsedError;
  int? get group => throw _privateConstructorUsedError;
  int? get course => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'accept_politic')
  bool? get acceptPolitic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentProfileDtoCopyWith<StudentProfileDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentProfileDtoCopyWith<$Res> {
  factory $StudentProfileDtoCopyWith(
          StudentProfileDto value, $Res Function(StudentProfileDto) then) =
      _$StudentProfileDtoCopyWithImpl<$Res, StudentProfileDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sub_group') int? subGroup,
      int? group,
      int? course,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'accept_politic') bool? acceptPolitic});
}

/// @nodoc
class _$StudentProfileDtoCopyWithImpl<$Res, $Val extends StudentProfileDto>
    implements $StudentProfileDtoCopyWith<$Res> {
  _$StudentProfileDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subGroup = freezed,
    Object? group = freezed,
    Object? course = freezed,
    Object? fullName = freezed,
    Object? acceptPolitic = freezed,
  }) {
    return _then(_value.copyWith(
      subGroup: freezed == subGroup
          ? _value.subGroup
          : subGroup // ignore: cast_nullable_to_non_nullable
              as int?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as int?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      acceptPolitic: freezed == acceptPolitic
          ? _value.acceptPolitic
          : acceptPolitic // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentProfileDtoImplCopyWith<$Res>
    implements $StudentProfileDtoCopyWith<$Res> {
  factory _$$StudentProfileDtoImplCopyWith(_$StudentProfileDtoImpl value,
          $Res Function(_$StudentProfileDtoImpl) then) =
      __$$StudentProfileDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sub_group') int? subGroup,
      int? group,
      int? course,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'accept_politic') bool? acceptPolitic});
}

/// @nodoc
class __$$StudentProfileDtoImplCopyWithImpl<$Res>
    extends _$StudentProfileDtoCopyWithImpl<$Res, _$StudentProfileDtoImpl>
    implements _$$StudentProfileDtoImplCopyWith<$Res> {
  __$$StudentProfileDtoImplCopyWithImpl(_$StudentProfileDtoImpl _value,
      $Res Function(_$StudentProfileDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subGroup = freezed,
    Object? group = freezed,
    Object? course = freezed,
    Object? fullName = freezed,
    Object? acceptPolitic = freezed,
  }) {
    return _then(_$StudentProfileDtoImpl(
      subGroup: freezed == subGroup
          ? _value.subGroup
          : subGroup // ignore: cast_nullable_to_non_nullable
              as int?,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as int?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
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
class _$StudentProfileDtoImpl implements _StudentProfileDto {
  const _$StudentProfileDtoImpl(
      {@JsonKey(name: 'sub_group') this.subGroup,
      this.group,
      this.course,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'accept_politic') this.acceptPolitic});

  factory _$StudentProfileDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentProfileDtoImplFromJson(json);

  @override
  @JsonKey(name: 'sub_group')
  final int? subGroup;
  @override
  final int? group;
  @override
  final int? course;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'accept_politic')
  final bool? acceptPolitic;

  @override
  String toString() {
    return 'StudentProfileDto(subGroup: $subGroup, group: $group, course: $course, fullName: $fullName, acceptPolitic: $acceptPolitic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentProfileDtoImpl &&
            (identical(other.subGroup, subGroup) ||
                other.subGroup == subGroup) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.acceptPolitic, acceptPolitic) ||
                other.acceptPolitic == acceptPolitic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, subGroup, group, course, fullName, acceptPolitic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentProfileDtoImplCopyWith<_$StudentProfileDtoImpl> get copyWith =>
      __$$StudentProfileDtoImplCopyWithImpl<_$StudentProfileDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentProfileDtoImplToJson(
      this,
    );
  }
}

abstract class _StudentProfileDto implements StudentProfileDto {
  const factory _StudentProfileDto(
          {@JsonKey(name: 'sub_group') final int? subGroup,
          final int? group,
          final int? course,
          @JsonKey(name: 'full_name') final String? fullName,
          @JsonKey(name: 'accept_politic') final bool? acceptPolitic}) =
      _$StudentProfileDtoImpl;

  factory _StudentProfileDto.fromJson(Map<String, dynamic> json) =
      _$StudentProfileDtoImpl.fromJson;

  @override
  @JsonKey(name: 'sub_group')
  int? get subGroup;
  @override
  int? get group;
  @override
  int? get course;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'accept_politic')
  bool? get acceptPolitic;
  @override
  @JsonKey(ignore: true)
  _$$StudentProfileDtoImplCopyWith<_$StudentProfileDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
