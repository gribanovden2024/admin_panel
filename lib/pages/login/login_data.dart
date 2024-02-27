import 'package:admin_panel/interseptor/profile/teacher_profile/data/teacher_profile_url.dart';
import 'package:admin_panel/interseptor/profile_repository.dart';
import 'package:admin_panel/pages/login/dto/free_token_dto.dart';
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
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      webOptions: WebOptions(
          dbName: 'FlutterEncryptedStorage',
          publicKey: 'FlutterEncryptedStorage'));
  static Dio dio = Dio();

  Future<void> initDio() async {
    // getFreeToken();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
  }

  final TeacherProfileService _service = TeacherProfileService(dio);

  Future<void> getCode(String email) async {
    await _service.part1Email(request: '{"email":"$email"}');
  }

  Future<bool> emailRequest(String email) async {
    Response response = await dio.post(
        'https://vsu-stage.fittin.ru' + TeacherProfileUrl.emailPart1,
        data: {"email": "$email"});
    if (response.statusCode == 200/*|| response.statusCode == 400*/)
      return true;
    else return false;
  }

  Future<bool> confirmEmailCode(String email, String code) async {
    Response response = await dio.post(
        'https://vsu-stage.fittin.ru' + TeacherProfileUrl.emailPart2,
        data: {"email": "$email", "code": "$code"});
    if (response.statusCode == 200/*|| response.statusCode == 400*/)
      return true;
    else return false;
  }

  Future<void> getFreeToken() async {
    final uuid = await _getUuid();
    FreeTokenDto token = await _service.postTokenFree(
        request: TokenFreeRequestDto(userUuid: uuid));
    acses = token.accessToken!;
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
