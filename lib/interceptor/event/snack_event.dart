import 'package:admin_panel/interceptor/event_bus/event.dart';

class SnackBarEvent extends IEvent {
  SnackBarEvent({
    required super.name,
    required this.message,
  });

  final String message;
}
