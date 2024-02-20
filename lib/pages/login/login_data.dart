import 'package:admin_panel/pages/login/teacher_profile_service.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'dto/email_part1_request/email_part1_request.dart';
import 'dto/email_part2_request/email_part2_request.dart';
import 'dto/token_free_request_dto.dart';

class LoginData {
  final TeacherProfileService _service =TeacherProfileService(Dio());

  Future<void> getCode(String email) async {
      await loginAsTeacherByEmail(email);
  }

  Future<LoginStatus> emailRequest(String email) async {
    await _service.part1Email(request: EmailPart1Request(email: email));
    return LoginStatus(
      loginRequired: true,
      isAuthorized: false,
    );
  }

  Future<LoginStatus> confirmEmailCode(String email, String code) async {
    await _service.part2Email(
      request: EmailPart2Request(email: email, code: code),
    );
    return LoginStatus(
      loginRequired: true,
      isAuthorized: false,
    );
  }

  Future<void> loginAsTeacherByEmail(String email) async {
    await emailRequest(email);
  }

  @override
  Future<void> getFreeToken() async {
    try {
      final uuid = await _getUuid();
      await _service.postTokenFree(
        request: TokenFreeRequestDto(
          userUuid: uuid,
        ),
      );
    } catch (e) {
      rethrow;
    }
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

class LoginStatus {
  final bool isAuthorized;
  final bool? registrationRequired;
  final bool? loginRequired;
  final String? message;

  LoginStatus({
    required this.isAuthorized,
    this.registrationRequired,
    this.loginRequired = true,
    this.message,
  });
}
