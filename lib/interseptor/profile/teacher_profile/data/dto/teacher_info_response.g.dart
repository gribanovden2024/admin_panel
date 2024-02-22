// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$TeacherInfoResponseToJson(TeacherInfoResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('middlename', instance.middlename);
  writeNotNull('rank', instance.rank);
  writeNotNull('department_name', instance.departmentName);
  writeNotNull('faculty', instance.faculty);
  writeNotNull('accept_politic', instance.acceptPolitic);
  return val;
}

_$TeacherInfoResponseImpl _$$TeacherInfoResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TeacherInfoResponseImpl(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      middlename: json['middlename'] as String?,
      rank: json['rank'] as String?,
      departmentName: json['department_name'] as String?,
      faculty: json['faculty'] as String?,
      acceptPolitic: json['accept_politic'] as bool?,
    );

Map<String, dynamic> _$$TeacherInfoResponseImplToJson(
        _$TeacherInfoResponseImpl instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'middlename': instance.middlename,
      'rank': instance.rank,
      'department_name': instance.departmentName,
      'faculty': instance.faculty,
      'accept_politic': instance.acceptPolitic,
    };
