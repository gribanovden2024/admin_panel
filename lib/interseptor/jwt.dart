import 'dart:io' show Platform;

import 'package:dio/dio.dart';
// import 'package:fittin_demo/util/uuid_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/login/interceptor/uuid_manager.dart';

/// Interceptor for working with JWT tokens, updating and saving them.
/// Requires [Dio] to work.

class JWTInterceptor extends QueuedInterceptor {
  /// Create instance of [JWTInterceptor].
  JWTInterceptor({
    required Dio dio,
    bool useCaching = true,
  })  : _dio = dio,
        _useCaching = useCaching;

  /// Getting tokens from cache.
  Future<void> initTokens() async {
    if (_useCaching) {
      final _storage = await SharedPreferences.getInstance();
      _accessToken = _storage.getString('accessToken');
      _refreshToken = _storage.getString('refreshToken');
    }
    if (_refreshToken == null) {
      await _getFreeToken(isInit: true);
    } else {
      await _refresh();
    }
  }

  /// Http client.
  final Dio _dio;

  /// JWT token.
  String? _accessToken;

  /// JWT refresh token.
  String? _refreshToken;

  /// Client for working with cache.
  // final FlutterSecureStorage _storage = const FlutterSecureStorage(
  //     aOptions: AndroidOptions(
  //   encryptedSharedPreferences: true,
  // ));

  /// Use to enable/disable token caching. Default value is true
  final bool _useCaching;

  /// Add JWT authorization token to any request, if available.
  @override
  void onRequest(options, handler) {
    if (_accessToken != null) {
      options.headers['Authorization'] = 'Bearer $_accessToken';
    }

    if (options.uri.path == '/auth/token/free') {
      options.headers['Authorization'] = 'Basic YXBwOmZpdHRpbmFwcA==';
    }
    options.headers['ostype'] = Platform.isIOS ? 'ios' : 'android';

    return super.onRequest(options, handler);
  }

  /// Save tokens received after authorization.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.requestOptions.path == '/auth/phone/part2') {
      await _saveTokens(response);
    }

    if (response.requestOptions.path == '/auth/token/free') {
      await _saveTokens(response, isFreeToken: true);
    }
    super.onResponse(response, handler);
  }

  /// Update JWT token if it is outdated.
  @override
  Future onError(error, handler) async {
    // todo(netos23): fix it
    if ((error.response?.statusCode == 403 ||
        error.response?.statusCode == 401) &&
        error.requestOptions.path != '/auth/phone/part1') {
      await _refresh();
      final response = await _retry(error.requestOptions);
      handler.resolve(response);
    }
    return super.onError(error, handler);
  }

  /// Make a request to update the JWT token and save it to cache.
  Future<void> _refresh() async {
    if (_refreshToken == null) {
      await _getFreeToken();
      return;
    }

    try {
      final response = await _dio.post(
        '/auth/v1/token/refresh',
        data: {'refresh_token': _refreshToken},
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        await _saveTokens(response);
      }
    } catch (e) {
      await _getFreeToken();
    }
  }

  /// Repeat the failed request.
  Future<Response<dynamic>> _retry(RequestOptions requestOptions) {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  /// Save tokens and cache them.
  Future<void> _saveTokens(Response response,
      {bool isFreeToken = false}) async {
    if (isFreeToken) {
      _accessToken = response.data['access_token'];
      _refreshToken = response.data['refresh_token'];
    } else {
      _accessToken = response.data['data']['access_token'];
      _refreshToken = response.data['data']['refresh_token'];
    }
    if (_useCaching) {
      final _storage = await SharedPreferences.getInstance();
      await _storage.setString('accessToken', _accessToken!);
      await _storage.setString('refreshToken', _refreshToken!);
    }
  }

  Future<void> _getFreeToken({bool isInit = false}) async {
    final response = await _dio.post('/auth/token/free',
        data: {'user_uuid': UuidManager.cachedUuid},
        options: Options(
          headers: {'Authorization': "Basic YXBwOmZpdHRpbmFwcA=="},
        ));

    if (isInit) {
      await _saveTokens(response, isFreeToken: true);
    }
  }
}
