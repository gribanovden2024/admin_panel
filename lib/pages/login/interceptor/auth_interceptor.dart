import 'package:dio/dio.dart';

import '../navigation/navigation.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._navigation);

  final Navigation _navigation;

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    if (error.response?.statusCode == 471) {
      _navigation.routeTo(
        RouteBundle(
          route: Routes.loginByPhone,
          useRootNavigator: true,
        ),
      );
    } else {
      super.onError(error, handler);
    }
  }
}
