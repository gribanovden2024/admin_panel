// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_request.freezed.dart';
part 'auth_request.g.dart';

@freezed
class AuthRequest with _$AuthRequest {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  const factory AuthRequest({
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'password') required String password,
  }) = _AuthRequest;

  factory AuthRequest.fromJson(Map<String, dynamic> json) => _$AuthRequestFromJson(json);
}
