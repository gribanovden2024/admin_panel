import 'package:rxdart/rxdart.dart';
import 'app_config.dart';
import 'environment.dart';
import 'environment_repository.dart';

class AppEnvironment extends Environment {
  final AppConfig _config;
  final EnvironmentRepository _repository;
  final BehaviorSubject<AppConfig> _configController = BehaviorSubject();

  AppEnvironment.fromConfig({
    required AppConfig defaultConfig,
    required EnvironmentRepository environmentRepository,
  })  : _repository = environmentRepository,
        _config = defaultConfig;

  AppEnvironment.fromRepository({
    required AppConfig defaultConfig,
    required EnvironmentRepository environmentRepository,
  })  : _repository = environmentRepository,
        _config = environmentRepository.loadConfig() ?? defaultConfig;

  @override
  AppConfig get config => _configController.valueOrNull ?? _config;

  @override
  void init() {
    _configController.add(config);
    _repository.saveConfig(config);
  }

  @override
  Stream<AppConfig> get configStream => _configController.stream;

  @override
  void dispose() {
    _configController.close();
  }

  @override
  void saveConfig(AppConfig config) {
    _configController.add(config);
    _repository.saveConfig(config);
  }
}
