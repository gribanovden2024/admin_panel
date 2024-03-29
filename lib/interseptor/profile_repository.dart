import 'package:admin_panel/interseptor/event/error_event.dart';
import 'package:admin_panel/interseptor/profile/login_status.dart';
import 'package:admin_panel/interseptor/profile/model/auth_request.dart';
import 'package:admin_panel/interseptor/profile/model/auth_response.dart';
import 'package:admin_panel/interseptor/profile/service/profile_service.dart';
import 'package:admin_panel/interseptor/profile/teacher_profile/data/dto/free_token_dto.dart';
import 'package:admin_panel/interseptor/profile/teacher_profile/data/dto/token_free_request_dto.dart';
import 'package:admin_panel/interseptor/profile/user_data.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
String? accessToken;
String? refreshToken;
abstract class IProfileRepository<T extends IUserData> {
  Future<T> updateProfileInfo({
    required T request,
  });

  Future<void> getFreeToken();

  Future<AuthResponse> emailAndPasswordRequest(String email, String password);

  Future<LoginStatus> emailRequest(String email);

}

class ProfileRepository implements IProfileRepository<UserData> {
  ProfileRepository(this._service);

  final ProfileService _service;

  @override
  Future<AuthResponse> emailAndPasswordRequest(
      String email, String password) async {
    try {
      final response = await _service.postAuthPasswordLogin(
          request: AuthRequest(username: email, password: password));
      return response;
    } on DioException catch (error) {
      throw ErrorEvent(
        name: 'login exception',
        message: error.error.toString(),
      );
    }
    // return LoginStatus(
    //   isAuthorized: false,
    // );
  }

  @override
  Future<LoginStatus> emailRequest(String email) async {
    if (email == 'test_t_t') {
      return LoginStatus(
        loginRequired: true,
        isAuthorized: false,
      );
    }
    return LoginStatus(
      isAuthorized: false,
      loginRequired: false,
    );
  }

  @override
  Future<UserData> updateProfileInfo({required IUserData request}) async {
    throw UnimplementedError();
  }

  @override
  Future<void> getFreeToken() async {
    // try {
      final uuid = await _getUuid();
      print('uuid = $uuid');
      FreeTokenDto response = await _service.postTokenFree(
        request: TokenFreeRequestDto(
          userUuid: uuid,
        ),
      );
      accessToken = response.accessToken ?? '';
      refreshToken = response.refreshToken ?? '';
    // } catch (e) {
    //   print(e);
    //   rethrow;
    // }
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
