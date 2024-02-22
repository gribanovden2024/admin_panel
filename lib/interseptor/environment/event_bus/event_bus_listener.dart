import 'package:admin_panel/interseptor/environment/event_bus/middleware.dart';
// import 'package:admin_panel/interseptor/environment/middleware/navigation_middleware.dart';
// import 'package:admin_panel/interseptor/environment/middleware/snack_middleware.dart';
import 'package:auto_route/auto_route.dart';
import 'event_bus.dart';

class EventBusListener {
  final IEventBus eventBus;
  final StackRouter router;

  EventBusListener({
    required this.eventBus,
    required this.router,
  });

  // void init() {
  //   eventBus.addMiddleware(
  //     NavigationMiddleware(router: router) as IMiddleware,
  //   );
  //   eventBus.addMiddleware(
  //     SnackMiddleware(router: router) as IMiddleware,
  //   );
  // }
}
