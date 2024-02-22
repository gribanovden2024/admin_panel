import 'package:admin_panel/interseptor/environment/event_bus/event_bus.dart';
import 'package:admin_panel/interseptor/environment/lifecycle_module.dart';
import 'package:admin_panel/interseptor/event/error_event.dart';
import 'package:admin_panel/interseptor/event/info_event.dart';
import 'package:admin_panel/interseptor/profile/teacher_profile/data/teacher_profile_repository.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherProfileManager extends LifecycleModule {
  TeacherProfileManager(
    this._teacherProfileRepository,
    this._eventBus,
  );

  @override
  Future<void> init() async {
    super.init();
    _checkAuthorizationState();
  }

  final IEventBus _eventBus;

  final BehaviorSubject<bool> isLoggedIn = BehaviorSubject();

  final TeacherProfileRepository _teacherProfileRepository;

  final BehaviorSubject<String?> loginErrorController =
      BehaviorSubject.seeded(null);

  Future<void> loginAsTeacherByEmail(String email) async {
    try {
      loginErrorController.add(null);
      await _teacherProfileRepository.emailRequest(email);
    } on DioException catch (e) {
      loginErrorController.add(e.response?.data['message'] as String);
      rethrow;
    }
  }


  Future<void> confirmCode(String email, String code) async {
    try {
      await _teacherProfileRepository.confirmEmailCode(email, code);
      await _updateIsLoggined(true);
    } on ErrorEvent catch (exception) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await updateFreeToken();

      await _updateIsLoggined(false);
    } on ErrorEvent catch (exception) {
      rethrow;
    }
  }

  Future<void> deleteProfile() async {
    try {
      final status = await _teacherProfileRepository.deleteTeacherProfile();
      if (status) {
        logout();
        _eventBus.addEvent(InfoEvent(
          name: 'teacher deleted his account',
        ));
      }
    } on ErrorEvent catch (exception) {
      _eventBus.addEvent(exception);
      rethrow;
    } catch (unexpectedError) {
      _eventBus.addEvent(
        ErrorEvent(
          name: 'UnexpectedError',
          message: unexpectedError.toString(),
        ),
      );
      rethrow;
    }
  }

  Future<void> updateFreeToken() async {
    await _teacherProfileRepository.getFreeToken();
    await _updateIsLoggined(false);
  }

  // TODO(JohnyTwoJacket): в контексте 2 возможных ролей это будет работать криво
  Future<void> _checkAuthorizationState() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn.add(prefs.getBool('isLoggedIn') ?? false);
  }

  Future<void> _updateIsLoggined(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', value);
    isLoggedIn.add(value);
    prefs.setString('appType', isLoggedIn.value ? 'teacher' : '');
  }
}
