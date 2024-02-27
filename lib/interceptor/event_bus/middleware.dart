import 'event.dart';

abstract class IMiddleware {

  IEvent handleEvent(IEvent event) {
    return event;
  }
}
