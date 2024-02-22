import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_info_response.g.dart';

part 'teacher_info_response.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class TeacherInfoResponse with _$TeacherInfoResponse {
  const factory TeacherInfoResponse({
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'middlename') String? middlename,
    String? rank,
    @JsonKey(name: 'department_name') String? departmentName,
    String? faculty,
    @JsonKey(name: 'accept_politic') bool? acceptPolitic,
  }) = _TeacherInfoResponse;

  factory TeacherInfoResponse.fromJson(Map<String, dynamic> json) => _$TeacherInfoResponseFromJson(json);
}
