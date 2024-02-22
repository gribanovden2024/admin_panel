import 'package:admin_panel/interseptor/event/error_event.dart';
import 'package:admin_panel/interseptor/profile/login_status.dart';
import 'package:admin_panel/interseptor/profile/teacher_profile/data/dto/email_part1_request.dart';
import 'package:admin_panel/interseptor/profile/teacher_profile/data/dto/email_part2_request.dart';
import 'package:admin_panel/interseptor/profile/teacher_profile/data/dto/token_free_request_dto.dart';
import 'package:admin_panel/interseptor/profile/teacher_profile/data/teacher_profile_service.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class TeacherProfileRepository {
  TeacherProfileRepository(this._service);

  final TeacherProfileService _service;

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

  Future<bool> deleteTeacherProfile() async {
    try {
      await _service.deleteTeacherProfile();
      return true;
    } on DioException catch (e) {
      throw ErrorEvent(
        name: 'Delete user exception',
        message: e.response?.data['message'],
      );
    } catch (e) {
      throw ErrorEvent(name: 'unexpected error', message: e.toString());
    }
  }
}
