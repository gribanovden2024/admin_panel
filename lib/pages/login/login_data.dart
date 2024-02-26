import 'package:admin_panel/pages/login/teacher_profile/teacher_profile_service.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../interseptor/environment/interceptor/jwt_interceptor.dart';
import '../../interseptor/profile/login_status.dart';
import 'dto/email_part1_request/email_part1_request.dart';
import 'dto/email_part2_request/email_part2_request.dart';
import 'dto/token_free_request_dto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginData {
  FlutterSecureStorage storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      webOptions: WebOptions(dbName: 'FlutterEncryptedStorage',
          publicKey: 'FlutterEncryptedStorage')
  );
  static Dio dio = Dio();
  Future<void> initDio() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var _accessToken = sharedPreferences.getString('accessToken');
    // var _accessToken = await storage.read(key: 'accessToken');
    var _refreshToken = sharedPreferences.getString('refreshToken');
    dio.options.headers['Authorization'] = '11Bearer $acses';
  }
  final TeacherProfileService _service = TeacherProfileService(dio);

  Future<void> getCode(String email) async {
    await _service.part1Email(request: '{"email":"$email"}');
  }

  Future<LoginStatus> emailRequest(String email) async {
    await _service.part1Email(request: '{"email":"$email"}');
    return LoginStatus(
      loginRequired: true,
      isAuthorized: false,
    );
  }

  Future<void> confirmEmailCode(String email, String code) async {
    await _service.part2Email(
        request: EmailPart2Request(email: email, code: code));
    // return LoginStatus(
    //   loginRequired: true,
    //   isAuthorized: false,
    // );
  }

  Future<void> getFreeToken() async {
    final uuid = await _getUuid();
    await _service.postTokenFree(request: TokenFreeRequestDto(userUuid: uuid));
  }

  Future<String> _getUuid() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    var uuid = sharedPreferences.getString('uuid');
    if (uuid == null) {
      uuid = const Uuid().v4();
      await sharedPreferences.setString('uuid', uuid);
    }
    return uuid;
  }
}

// class LoginStatus {
//   final bool isAuthorized;
//   final bool? registrationRequired;
//   final bool? loginRequired;
//   final String? message;
//
//   LoginStatus({
//     required this.isAuthorized,
//     this.registrationRequired,
//     this.loginRequired = true,
//     this.message,
//   });
// }
