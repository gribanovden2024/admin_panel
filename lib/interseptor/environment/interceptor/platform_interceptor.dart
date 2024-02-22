import 'dart:io';

import 'package:dio/dio.dart';

class PlatformInterceptor extends Interceptor {
  PlatformInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Client-OS'] = Platform.isIOS ? 'ios' : 'android';
    return super.onRequest(options, handler);
  }
}
