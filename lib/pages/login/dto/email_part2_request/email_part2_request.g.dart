// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_part2_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$EmailPart2RequestToJson(EmailPart2Request instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('code', instance.code);
  return val;
}

_$EmailPart2RequestImpl _$$EmailPart2RequestImplFromJson(
        Map<String, dynamic> json) =>
    _$EmailPart2RequestImpl(
      email: json['email'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$EmailPart2RequestImplToJson(
        _$EmailPart2RequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };
