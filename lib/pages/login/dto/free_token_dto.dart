import 'dart:async';
import 'package:json_annotation/json_annotation.dart';
import '../../../utils/regexes.dart';
part 'free_token_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class FreeTokenDto {
  FreeTokenDto({
    this.userUuid,
    this.userId,
    this.accessToken,
    this.refreshToken,
  });

  final String? userUuid;
  final int? userId;
  final String? accessToken;
  final String? refreshToken;

  factory FreeTokenDto.fromJson(Json json) => _$FreeTokenDtoFromJson(json);
}

FutureOr<FreeTokenDto> deserializeFreeTokenDto(Json json) =>
    FreeTokenDto.fromJson(json);
