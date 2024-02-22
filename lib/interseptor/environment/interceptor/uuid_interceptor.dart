import 'package:admin_panel/interseptor/uuid_configurator.dart';
import 'package:dio/dio.dart';

class UUIDInterceptor extends Interceptor {
  UUIDInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Client-ID'] = UUIDConfigurator.uuid;
    return super.onRequest(options, handler);
  }
}
