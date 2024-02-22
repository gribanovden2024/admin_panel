
import 'package:admin_panel/interseptor/environment/event_bus/event.dart';
import 'package:json_annotation/json_annotation.dart';

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
