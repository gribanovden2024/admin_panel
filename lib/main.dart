import 'dart:io';

import 'package:admin_panel/pages/login/data/configure_dependencies.dart';
import 'package:admin_panel/pages/login/data/uuid_configurator.dart';
import 'package:admin_panel/pages/login/interceptor/jwt_interceptor.dart';
import 'package:core_interfaces/core_interfaces.dart';
import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:profile/profile.dart';
import 'package:core_models/core_models.dart';
import 'package:profile_data/profile_data.dart';
import 'package:provider/provider.dart';
import 'app.dart';

// void main() async {
//   final container = await configureContainer();
//   runApp(StartUpWidget(
//     container: container,
//     child: App(),
//   ),);
// }
void main() async {
  await initServices();
  runApp(App());
}

Future<void> configureContainer() async {
  configureDependencies();
  final container = getIt;
  await initServices();
  // return container;
}

Future<void> initServices() async {
  Dio dio = Dio();
  initDio(dio);
  final IEventBus _eventBus = EventBus();
  final IProfileRepository<UserData> _profileRepository =
      ProfileRepository(ProfileService(dio));

  final jwtInterceptor = JWTInterceptor(dio: dio);
  dio.interceptors.add(jwtInterceptor);
  await jwtInterceptor.initTokens();
}

void initDio(Dio dio) async {
  const timeout = Duration(seconds: 30);
  dio.options
    ..baseUrl = 'https://vsu-stage.fittin.ru'
    ..connectTimeout = timeout
    ..receiveTimeout = timeout
    ..contentType = 'application/json'
    ..sendTimeout = timeout;
  // dio.interceptors.add(PlatformInterceptor());
  // dio.interceptors.add(UUIDInterceptor());
}

class PlatformInterceptor extends Interceptor {
  PlatformInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Client-OS'] = Platform.isIOS ? 'ios' : 'android';
    return super.onRequest(options, handler);
  }
}

class UUIDInterceptor extends Interceptor {
  UUIDInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Client-ID'] = UUIDConfigurator.uuid;
    return super.onRequest(options, handler);
  }
}

class StartUpWidget extends StatelessWidget {
  const StartUpWidget({
    super.key,
    required this.container,
    required this.child,
  });

  final GetIt container;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StartUpDomains(
      container: container,
      child: child,
    );
  }
}

class StartUpDomains extends StatelessWidget {
  const StartUpDomains({
    required this.child,
    super.key,
    required this.container,
  });

  final GetIt container;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => container,
      child: child,
    );
  }
}
