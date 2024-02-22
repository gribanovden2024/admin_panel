// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_part1_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$EmailPart1RequestToJson(EmailPart1Request instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  return val;
}

_$EmailPart1RequestImpl _$$EmailPart1RequestImplFromJson(
        Map<String, dynamic> json) =>
    _$EmailPart1RequestImpl(
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$EmailPart1RequestImplToJson(
        _$EmailPart1RequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
    };
