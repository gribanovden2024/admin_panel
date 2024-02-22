import 'app_config.dart';


typedef EnvironmentListener = void Function();

abstract class Environment implements LifecycleModule {
  AppConfig get config;
  Stream<AppConfig> get configStream;

  void saveConfig(AppConfig config);
}
abstract class LifecycleModule {
  void init() {}

  void dispose() {}
}
