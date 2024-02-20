import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_part2_request.g.dart';

part 'email_part2_request.freezed.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
@freezed
class EmailPart2Request with _$EmailPart2Request {
  const factory EmailPart2Request({
    String? email,
    String? code,
  }) = _EmailPart2Request;

  factory EmailPart2Request.fromJson(Map<String, dynamic> json) => _$EmailPart2RequestFromJson(json);
}
