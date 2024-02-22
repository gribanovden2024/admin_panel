import 'package:admin_panel/interseptor/environment/event_bus/event_bus.dart';
import 'package:admin_panel/interseptor/event/error_event.dart';
import 'package:admin_panel/interseptor/event/info_event.dart';
import 'package:admin_panel/interseptor/profile/login_status.dart';
import 'package:admin_panel/interseptor/profile/user_data.dart';
import 'package:admin_panel/interseptor/environment/lifecycle_module.dart';
import 'package:admin_panel/interseptor/profile_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IProfile<T extends IUserData> {
  BehaviorSubject<T?> get userData;

  BehaviorSubject<bool> get isLoggedIn;

  BehaviorSubject<int?> get chosenSemester;

  Future<void> updateUserData();

  Future<void> changeUserData(T newUserData);

  Future<void> logout();

  Future<void> clearProfile();

  Future<void> updateFreeToken();

  Future<void> loginAsStudent(String mail, String password);
}

class Profile<T extends IUserData> extends LifecycleModule implements IProfile<T> {
  Profile(
    this._profileRepository,
    this._eventBus,
  );

  final IEventBus _eventBus;
  final IProfileRepository<T> _profileRepository;
  final BehaviorSubject<T?> _userData = BehaviorSubject();
  final BehaviorSubject<bool> _isLoggedIn = BehaviorSubject();


  @override
  BehaviorSubject<int?> chosenSemester = BehaviorSubject.seeded(0);

  @override
  Future<void> init() async {
    super.init();
    _checkAuthorizationState();
  }

  @override
  void dispose() {
    _userData.close();
    _isLoggedIn.close();

    super.dispose();
  }

  @override
  BehaviorSubject<T?> get userData => _userData;

  @override
  BehaviorSubject<bool> get isLoggedIn => _isLoggedIn;

  @override
  Future<void> changeUserData(T newIUserData) async {
    try {
      final userData = await _profileRepository.updateProfileInfo(
        request: newIUserData,
      );
      _userData.add(userData);
      _eventBus.addEvent(InfoEvent(
        name: 'user data has changed',
        payload: _userData.valueOrNull,
      ));
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

  @override
  Future<void> loginAsStudent(String mail, String password) async {
    try {
      final response = await _profileRepository.emailAndPasswordRequest(mail, password);
      if (response.accessToken.isNotEmpty) {
        _eventBus.addEvent(InfoEvent(
          name: 'user is authorized',
        ));
        await _updateIsLoggined(true);
        updateUserData();
      } else {
        _eventBus.addEvent(
          InfoEvent(
            name: 'user is not authorized',
            // payload: status.message,
          ),
        );
        await _updateIsLoggined(false);
      }
    } catch (exception) {
      await _updateIsLoggined(false);
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await updateFreeToken();
      _userData.add(null);

      await _updateIsLoggined(false);

      _eventBus.addEvent(InfoEvent(
        name: 'user has logout',
      ));
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


  @override
  Future<void> updateUserData() async {
    if (_isLoggedIn.valueOrNull == false) {
      return;
    }

    try {
      final userData = await _profileRepository.getProfileInfo();
      _userData.add(userData);
      _eventBus.addEvent(InfoEvent(
        name: 'user updated his account',
        payload: _userData.valueOrNull,
      ));
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

  @override
  Future<void> clearProfile() async {
    _userData.add(null);
    await updateFreeToken();
  }

  @override
  Future<void> updateFreeToken() async {
    await _profileRepository.getFreeToken();
    await _updateIsLoggined(false);
  }

  // TODO(JohnyTwoJacket): в контексте 2 возможных ролей это будет работать криво
  Future<void> _checkAuthorizationState() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn.add(prefs.getBool('isLoggedIn') ?? false);
  }

  Future<void> _updateIsLoggined(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', value);
    _isLoggedIn.add(value);
    prefs.setString('appType', _isLoggedIn.value ? 'student' : '');
  }
}
