import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';


class UuidManager {
  static String? _cachedUuid;

  static String? get cachedUuid => _cachedUuid;

  static Future<void> initUUID() async {
    await _getUuid(false);
  }

  static Future<String> _getUuid(bool sync) async {
    if (_cachedUuid != null) {
      return _cachedUuid!;
    }

    final prefs = await SharedPreferences.getInstance();
    final savedUuid = prefs.getString('uuid');
    if (savedUuid != null) {
      _cachedUuid = savedUuid;
      // if (sync) {
      //   syncUuid();
      // }

      return savedUuid;
    }

    var uuid = const Uuid().v4();
    _cachedUuid = uuid;
    // if (sync) {
    //   syncUuid();
    // }
    prefs.setString('uuid', uuid).ignore();

    return cachedUuid!;
  }

  // static void syncUuid() {
  //   ProfileActions().setMeta(
  //     Meta((builder) => builder
  //       ..userUuid = cachedUuid,
  //     ),
  //   );
  // }
}
