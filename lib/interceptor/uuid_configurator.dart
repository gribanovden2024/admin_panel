import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class UUIDConfigurator {
  static const uuidKey = 'uuid';
  static late String uuid;

  @deprecated
  static Future<void> configUuid() async {
    uuid = await _getUuid();
  }

  @deprecated
  static Future<String> _getUuid() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    var uuid = sharedPreferences.getString(uuidKey);
    print(uuid);
    if (uuid == null) {
      //final deviceId = await _getDeviceId();
      uuid = const Uuid().v4();
      await sharedPreferences.setString(uuidKey, uuid);
    }
    return uuid;
  }

  @deprecated
  static Future<String> _getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      return (await deviceInfo.androidInfo).androidId;
    } else {
      return (await deviceInfo.iosInfo).identifierForVendor;
    }
  }
}
