// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$StudentProfileDtoToJson(StudentProfileDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sub_group', instance.subGroup);
  writeNotNull('group', instance.group);
  writeNotNull('course', instance.course);
  writeNotNull('full_name', instance.fullName);
  writeNotNull('accept_politic', instance.acceptPolitic);
  return val;
}

_$StudentProfileDtoImpl _$$StudentProfileDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentProfileDtoImpl(
      subGroup: json['sub_group'] as int?,
      group: json['group'] as int?,
      course: json['course'] as int?,
      fullName: json['full_name'] as String?,
      acceptPolitic: json['accept_politic'] as bool?,
    );

Map<String, dynamic> _$$StudentProfileDtoImplToJson(
        _$StudentProfileDtoImpl instance) =>
    <String, dynamic>{
      'sub_group': instance.subGroup,
      'group': instance.group,
      'course': instance.course,
      'full_name': instance.fullName,
      'accept_politic': instance.acceptPolitic,
    };
