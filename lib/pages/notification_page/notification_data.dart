import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../interseptor/profile_repository.dart';

class NotificationData {
  FlutterSecureStorage storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      webOptions: WebOptions(
          dbName: 'FlutterEncryptedStorage',
          publicKey: 'FlutterEncryptedStorage'));
  static Dio dio = Dio();

  Future<void> initDio() async {
    // getFreeToken();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    dio.options.baseUrl = 'https://vsu-stage.fittin.ru';
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    )
    );
  }
  Future<Response?> getGroups() async {
    Response response = await dio.get('/admin_panel/groups_list');
    if (response.statusCode == 200/*|| response.statusCode == 400*/)
      return response;
    else return null;
  }
  Future<Response?> getNotifications() async {
    Response response = await dio.get('/admin_panel/notification');
    if (response.statusCode == 200/*|| response.statusCode == 400*/)
      return response;
    else return null;
  }Future<Response?> getNotificationList() async {
    Response response = await dio.get('/admin_panel/notification_list');
    if (response.statusCode == 200/*|| response.statusCode == 400*/)
      return response;
    else return null;
  }
}