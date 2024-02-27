import 'package:auto_route/auto_route.dart';
import 'package:fkn/environment/event_bus/event.dart';

abstract class NavigationEvent extends IEvent {
  NavigationEvent({required super.name});
}

class PopNavigationEvent extends NavigationEvent {
  PopNavigationEvent({
    required super.name,
  });
}

class NamedNavigationEvent extends NavigationEvent {
  final String route;

  NamedNavigationEvent({
    required super.name,
    required this.route,
  });
}

class BundleNavigationEvent<T extends PageRouteInfo> extends NavigationEvent {
  final T route;

  BundleNavigationEvent({
    required super.name,
    required this.route,
  });
}

class PopUntilAndPushNavigationEvent<T extends PageRouteInfo> extends NavigationEvent {
  final T route;

  PopUntilAndPushNavigationEvent({
    required super.name,
    required this.route,
  });
}
