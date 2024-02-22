import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'app_config.dart';

const _kConfig = 'AppConfig';

class EnvironmentRepository {
  SharedPreferences? _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  AppConfig? loadConfig() {
    final json = _preferences?.getString(_kConfig);

    if (json == null) {
      return null;
    }

    return AppConfig.fromJson(jsonDecode(json));
  }

  void saveConfig(AppConfig config) {
    _preferences?.setString(_kConfig, jsonEncode(config.toJson()));
  }

  String? readStringFromSharedPreference(String key) {
    return _preferences?.getString(key);
  }

  void writeStringFromSharedPreference(String key, String value) {
    _preferences?.setString(key, value);
  }
}
