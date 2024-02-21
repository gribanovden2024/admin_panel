import 'package:dio/dio.dart';

import '../navigation/navigation.dart';

/// Сомнительное решение
class TimeoutInterceptor extends Interceptor {
  TimeoutInterceptor(this._navigation);

  final Navigation _navigation;

  bool isTimeout(DioErrorType errorType) =>
      // errorType == DioErrorType.connectTimeout ||
      errorType == DioErrorType.receiveTimeout ||
      errorType == DioErrorType.sendTimeout;

  bool isLostConnection(DioError error) =>
      // error.type == DioErrorType.other &&
      error.message ==
          "SocketException: Failed host lookup: 'fitomarket.fittin.ru'"
              ' (OS Error: No address associated with hostname, errno = 7)';

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    if (isLostConnection(error)) {
      _navigation.displayErrorSnackBar(
        'Потеряно соединение с интернетом',
      );
    } else if (isTimeout(error.type)) {
      _navigation.displayErrorSnackBar(
        'Время ожидания ответа от сервера истекло',
      );
    } else {
      super.onError(error, handler);
    }
  }
}
