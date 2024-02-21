// ignore_for_file: inference_failure_on_instance_creation

import 'package:admin_panel/pages/login/navigation/route_bundle.dart';
import 'package:flutter/material.dart';

export 'route_bundle.dart';
export 'routes.dart';

class Navigation extends ChangeNotifier {
  Navigation({required int currentIndex}) : _currentIndex = currentIndex;

  /// Navigation key for root navigator.
  final GlobalKey<NavigatorState> _rootNavigationKey =
      GlobalKey<NavigatorState>();

  /// Key for scaffold messenger.
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  /// Current bottom navigation bar index.
  int _currentIndex;

  /// Navigation keys for nested navigators.
  final List<GlobalKey<NavigatorState>> nestedNavigationKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  GlobalKey<NavigatorState> get rootNavigationKey => _rootNavigationKey;

  GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey =>
      _scaffoldMessengerKey;

  int get currentIndex => _currentIndex;

  GlobalKey<NavigatorState> get _currentNestedKey =>
      nestedNavigationKeys[_currentIndex];

  set currentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  /// Push new screen.
  Future<T?> routeTo<T extends Object?>(RouteBundle bundle) async {
    return await getCurrentNavigationState(bundle.useRootNavigator)
        ?.pushNamed<T>(
      bundle.route,
      arguments: bundle.data,
    );
  }

  /// Push replacement new screen.
  Future<T?> routeReplacementTo<T extends Object?>(RouteBundle bundle) async {
    return await getCurrentNavigationState(bundle.useRootNavigator)
        ?.pushReplacementNamed(bundle.route, arguments: bundle.data);
  }

  /// Push new screen and remove until.
  Future<T?> routeToAndRemoveUntil<T extends Object?>(
      RouteBundle bundle) async {
    return await getCurrentNavigationState(bundle.useRootNavigator)
        ?.pushNamedAndRemoveUntil(bundle.route, (route) => route.isFirst,
            arguments: bundle.data);
  }

  /// Pop current screen if it can.
  Future<bool?> routeBack({
    Object? data,
    bool? useRootNavigator = false,
  }) async {
    return await getCurrentNavigationState(useRootNavigator)?.maybePop(data);
  }

  /// Pop current screen to provided screen. Can't transport data!
  void routeBackTo(RouteBundle bundle) {
    getCurrentNavigationState(bundle.useRootNavigator)
        ?.popUntil(ModalRoute.withName(bundle.route));
  }

  /// Pop current screen to first screen in nested stack. Can't transport data!
  void routeBackToFirst({
    bool? useRootNavigator = false,
  }) {
    getCurrentNavigationState(useRootNavigator)
        ?.popUntil((route) => route.isFirst);
  }

  /// Pop current screen and then push new one.
  Future<T?> routeBackThenTo<T extends Object?>(RouteBundle bundle) async {
    return await getCurrentNavigationState(bundle.useRootNavigator)
        ?.popAndPushNamed(bundle.route, arguments: bundle.data);
  }

  /// Whether the navigator can be popped.
  bool? canPop({
    bool? useRootNavigator = false,
  }) {
    return getCurrentNavigationState(useRootNavigator)?.canPop();
  }

  /// Display snack bar with some information message.
  void displayInfoSnackBar(String message) {
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFFF2F2F2),
        content: Text(
          message,
          style: const TextStyle(color: Color(0xFF24292E)),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  /// Display snack bar with some error message.
  void displayErrorSnackBar(String message) {
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  /// Display material banner.
  void displayMaterialBanner(MaterialBanner materialBanner) {
    _scaffoldMessengerKey.currentState?.showMaterialBanner(materialBanner);
  }

  /// Display material banner.
  void hideMaterialBanner() {
    _scaffoldMessengerKey.currentState?.hideCurrentMaterialBanner();
  }

  // TODO(zerokivin) без редакса должно быть приватным
  NavigatorState? getCurrentNavigationState(bool? useRootNavigator) {
    if (useRootNavigator ?? false) {
      return _rootNavigationKey.currentState;
    } else {
      return _currentNestedKey.currentState;
    }
  }
}
