import 'package:admin_panel/interseptor/register_modules.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mutex/mutex.dart';
import 'package:uuid/uuid.dart';

import '../../interseptor/environment/interceptor/jwt_interceptor.dart';
import '../../interseptor/profile_repository.dart';

class NotificationData {
  static Dio dio = Dio();

  Future<void> initDio() async {
    dio.options.baseUrl = 'https://vsu-stage.fittin.ru';
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));
    dio.interceptors.add(
      SecureMethodInterceptor(
        endpoints: [
          '/auth/email/part1',
          '/auth/token/free',
          '/attendance/confirm_attendance/',
          '/attendance/get_net_attendance/'
        ],
        dio: dio,
      ),
    );
    dio.interceptors.add(AuthInterceptor(dio));
  }

  Future<Response?> getGroups() async {
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    Response response = await dio.get('/admin_panel/groups_list');
    return response.statusCode == 200 ? response : null;
  }

  Future<Response?> getNotifications() async {
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    Response response =
        await dio.get('/admin_panel/notification', data: {'id': '11'});
    return response.statusCode == 200 ?response :null;
  }

  Future<Response?> getNotificationList() async {
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    Response response = await dio.get('/admin_panel/notification_list');
    return response.statusCode == 200 ? response : null;
  }

  Future<Response?> postNotifications(List<int> id, String message) async {
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    dio.options.contentType = 'application/json';
    Response response = await dio.post(
      '/admin_panel/notification/',
      data: {
        'text': message,
        'groups': id,
      },
    );
    return response.statusCode == 200 ?response :null;
  }
}

class AuthInterceptor extends Interceptor {
  List<String> authUrls = const [
    '/auth/v1/phone/part2',
    '/auth/token/free',
    '/auth/v1/email_password/auth',
    '/auth/v1/email_password/register',
    '/auth/v1/social/auth',
    '/auth/social/',
    '/auth/token/free',
    '/auth/phone/part2',
    '/auth/login',
    '/auth/email/part2',
  ];
  String refreshUrl = '/auth/token/refresh';
  String freeTokenUrl = '/auth/token/free';
  String freeTokenAuthToken = 'YXBwOmZpdHRpbmFwcA==';
  final Dio dio;
  final mutex = Mutex();
  AuthInterceptor(this.dio);
  FlutterSecureStorage storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      webOptions: WebOptions(dbName: 'FlutterEncryptedStorage',
          publicKey: 'FlutterEncryptedStorage')
  );

  Future<void> initTokens() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool('first_run') ?? true) {
      await storage.deleteAll();
      sharedPreferences.setBool('first_run', false);
    }

    _accessToken = await storage.read(key: 'accessToken');
    _refreshToken = await storage.read(key: 'refreshToken');
    if (_accessToken == null || _refreshToken == null) {
      await updateFreeToken();
    }
  }

  /// JWT token.
  String? _accessToken;

  /// JWT refresh token.
  String? _refreshToken;

  /// Add JWT authorization token to any request, if available.
  @override
  Future<void> onRequest(options, handler) async {
    // if (accessToken != null) {
    //   options.headers['Authorization'] = 'Bearer $accessToken';
    // }
    if (options.path == freeTokenUrl) {
      options.headers['Authorization'] = 'Basic $freeTokenAuthToken';
    }
    return super.onRequest(options, handler);
  }

  /// Save tokens received after authorization.
  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (authUrls.contains(response.requestOptions.path)) {
      await _saveTokens(
        accessToken2: response.data['access_token'],
        refreshToken2: response.data['refresh_token'],
      );
    }
    super.onResponse(response, handler);
  }

  /// Update JWT token if it is outdated.
  @override
  Future<void> onError(error, handler) async {
    try {
      if (error.response?.statusCode == 401 &&
          error.requestOptions.path != refreshUrl) {
        await mutex.protect(() async {
          await updateFreeToken();
        });
        final response = await _retry(error.requestOptions);
        return handler.resolve(response);
      }
    } catch (_) {
      return handler.reject(error);
    }
    return handler.next(error);
  }

  Future<void> updateFreeToken() async {
    final uuid = await _getUuid();
    Response response = await dio.post(freeTokenUrl, data: {"user_uuid": uuid});
    await _saveTokens(
        accessToken2: response.data['access_token'],
        refreshToken2: response.data['refresh_token']);
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

  /// Repeat the failed request.
  Future<Response<dynamic>> _retry(RequestOptions requestOptions) {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  /// Save tokens and cache them.
  Future<void> _saveTokens({
    required String accessToken2,
    required String refreshToken2,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    _accessToken = accessToken2;
    _refreshToken = refreshToken2;
    acses = refreshToken2;
    free = refreshToken2;
      await sharedPreferences.setString('accessToken', accessToken2);
      await sharedPreferences.setString('refreshToken', refreshToken2);
      await storage.write(key: 'accessToken', value: accessToken2);
      await storage.write(key: 'refreshToken', value: refreshToken2);
  }
}
