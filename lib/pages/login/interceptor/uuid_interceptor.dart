import 'package:dio/dio.dart';
import '../data/uuid_configurator.dart';

class UUIDInterceptor extends Interceptor {
  UUIDInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Device-UUID'] = UUIDConfigurator.uuid;
    return super.onRequest(options, handler);
  }
}
