import 'dart:async';
import 'package:admin_panel/utils/regexes.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_free_request_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createFactory: false,
)
class TokenFreeRequestDto {
  TokenFreeRequestDto({
    required this.userUuid,
  });

  final String userUuid;

  Json toJson() => _$TokenFreeRequestDtoToJson(this);
}

FutureOr<Json> serializeTokenFreeRequestDto(TokenFreeRequestDto object) =>
    object.toJson();
