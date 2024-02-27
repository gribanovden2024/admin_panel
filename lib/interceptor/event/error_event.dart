import 'package:admin_panel/interceptor/event_bus/event.dart';

import 'package:json_annotation/json_annotation.dart';

part 'error_event.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class ErrorEvent extends IEvent implements Exception{
  ErrorEvent({
    required super.name,
    this.message,
    this.errorText,
    this.stackTrace,
  });

  final String? message;
  final String? errorText;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final StackTrace? stackTrace;
}
