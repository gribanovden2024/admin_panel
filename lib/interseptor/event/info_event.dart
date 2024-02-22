import 'package:admin_panel/interseptor/environment/event_bus/event.dart';

class InfoEvent extends IEvent {
  InfoEvent({
    required super.name,
    this.payload,
  });

  final Object? payload;
}
