/// Bundle containing information about the navigation action.
class RouteBundle {
  RouteBundle({
    required this.route,
    this.data,
    this.useRootNavigator,
  });

  final String route;

  //ignore: no-object-declaration
  final Object? data;
  final bool? useRootNavigator;
}
