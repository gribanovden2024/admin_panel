import 'dart:io';

import 'package:admin_panel/pages/login/data/configure_dependencies.dart';
import 'package:admin_panel/pages/login/data/uuid_configurator.dart';
import 'package:core_interfaces/core_interfaces.dart' hide AppConfig, DebugConfig, Environment;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'interseptor/app_config.dart';
import 'interseptor/app_environment.dart';
import 'interseptor/environment.dart';
import 'interseptor/environment_repository.dart';
import 'interseptor/register_modules.dart';
import 'interseptor/startup.dart';

// void main() async {
//   final container = await configureContainer();
//   runApp(StartUpWidget(
//     container: container,
//     child: App(),
//   ),);
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UUIDConfigurator.configUuid();
  final environmentRepository = EnvironmentRepository();
  await environmentRepository.init();
  final environment = AppEnvironment.fromRepository(
    defaultConfig: AppConfig(
      baseUrl: 'https://vsu-stage.fittin.ru',
      stageUrl: 'https://vsu-stage.fittin.ru',
      prodUrl: 'https://vsu.fittin.ru',
      testUrl: 'https://vsu-stage.fittin.ru',
      proxyUrl: 'https://cors-anywhere.herokuapp.com/corsdemo',
      proxyStageUrl: '',
      proxyProdUrl: '',
      proxyTestUrl: '',
      config: DebugConfig(
        debugShowMaterialGrid: false,
        showPerformanceOverlay: false,
        checkerboardRasterCacheImages: false,
        checkerboardOffscreenLayers: false,
        showSemanticsDebugger: false,
        debugShowCheckedModeBanner: false,
      ),
    ),
    environmentRepository: environmentRepository,
  );
  final container = await configureContainer(environment);
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(
    StartUpWidget(
      environment: environment,
      container: container,
      child: App(
      ),
    ),
  );
}

Future<GetIt> configureContainer(Environment environment) async {
  configureDependencies();
  final container = getIt;
  await initServices(environment);
  return container;
}