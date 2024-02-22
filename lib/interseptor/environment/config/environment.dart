
import 'package:admin_panel/interseptor/environment/config/app_config.dart';

import '../lifecycle_module.dart';


typedef EnvironmentListener = void Function();

abstract class Environment implements LifecycleModule {
  AppConfig get config;
  Stream<AppConfig> get configStream;

  void saveConfig(AppConfig config);
}
