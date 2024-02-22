import 'dart:convert';
import 'dart:io';

import 'package:admin_panel/interseptor/environment/event_bus/event_bus.dart';
import 'package:admin_panel/interseptor/environment/interceptor/jwt_interceptor.dart';
import 'package:admin_panel/interseptor/profile/service/profile_service.dart';
import 'package:admin_panel/interseptor/profile/teacher_profile/data/teacher_profile_repository.dart';
import 'package:admin_panel/interseptor/profile/teacher_profile/data/teacher_profile_service.dart';
import 'package:admin_panel/interseptor/profile/teacher_profile/teacher_profile_manager.dart';
import 'package:admin_panel/interseptor/profile/user_data.dart';
import 'package:admin_panel/interseptor/profile_manager.dart';
import 'package:admin_panel/interseptor/profile_repository.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../pages/login/data/uuid_configurator.dart';
import 'configure_dependencies.dart';
import 'package:injectable/injectable.dart' hide Environment;

import 'environment.dart';

class BasicInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Basic YXBwOmZpdHRpbmFwcA==';
    super.onRequest(options, handler);
  }
}

Future<void> initServices(Environment environment) async {
  final profile = getIt.get<IProfile<UserData>>();
  final dio = RegisterModules._dio;
  initDio(environment: environment, dio: dio, additionalInterceptors: []);

  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ),
  );

  final jwtInterceptor = JWTInterceptor(
    dio: dio,
    profile: profile,
    freeTokenUrl: '/auth/token/free',
    refreshUrl: '/auth/token/refresh',
  );

  dio.interceptors.add(
    SecureMethodInterceptor(
      endpoints: [
        '/auth/email/part1',
        '/auth/token/free',
        '/attendance/confirm_attendance/'
      ],
      dio: dio,
    ),
  );

  dio.interceptors.add(jwtInterceptor);
  await jwtInterceptor.initTokens();



  (profile as Profile<UserData>).init();
  await RegisterModules._teacherProfileManager.init();
  RegisterModules._eventBus.init();
}

void initDio({
  Iterable<Interceptor>? additionalInterceptors,
  Environment? environment,
  required Dio dio,
}) {
  const timeout = Duration(seconds: 30);

  dio.options
    ..baseUrl = environment?.config.baseUrl ?? ''
    ..connectTimeout = timeout
    ..receiveTimeout = timeout
    ..contentType = 'application/json'
    ..sendTimeout = timeout;

  if (additionalInterceptors != null) {
    dio.interceptors.addAll(additionalInterceptors);
  }

  dio.interceptors.add(PlatformInterceptor());
  dio.interceptors.add(UUIDInterceptor());

  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ),
  );
}
class PlatformInterceptor extends Interceptor {
  PlatformInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Client-OS'] = Platform.isIOS ? 'ios' : 'android';
    return super.onRequest(options, handler);
  }
}
class UUIDInterceptor extends Interceptor {
  UUIDInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-Client-ID'] = UUIDConfigurator.uuid;
    return super.onRequest(options, handler);
  }
}


@module
abstract class RegisterModules {
  static final Dio _dio = Dio();
  static final EventBus _eventBus = EventBus();

  @Singleton(as: IEventBus)
  EventBus get eventBus => _eventBus;

  @singleton
  Dio get dio => _dio;

// profile
  @singleton
  static final ProfileRepository _profileRepository =
  ProfileRepository(ProfileService(_dio));

  @Singleton(as: IProfileRepository<UserData>)
  ProfileRepository get profileRepository => _profileRepository;

  static final Profile<UserData> _profile =
  Profile<UserData>(_profileRepository, _eventBus);

  @singleton
  IProfile<UserData> get profile => _profile;
  // teacherProfile
  @singleton
  static final TeacherProfileRepository _teacherProfileRepository =
      TeacherProfileRepository(TeacherProfileService(_dio));

  @singleton
  TeacherProfileRepository get teacherProfileRepository =>
      _teacherProfileRepository;

  static final TeacherProfileManager _teacherProfileManager =
      TeacherProfileManager(
    _teacherProfileRepository,
    _eventBus,
  );

  @singleton
  TeacherProfileManager get teacherProfileManager => _teacherProfileManager;

}


class SecureMethodInterceptor extends Interceptor {
  final Dio dio;

  List<String> endpoints;

  SecureMethodInterceptor({required this.endpoints, required this.dio});
  int getRnd(int x) {
    const int a = 211, c = 1663, m = 7875;
    return (a * x + c) % m;
  }
  static const String hackForHack =
      "sdglmkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkbndlirgjpsgkr[sjgsehijrepajgkaerhea;rjgksgzslhbrgjrlagaihg;"
      "jsegke;ogjesgsegjesgjelghehge;gjehge;jgoegiejgiej;ge;jgejgjghegje;je;gje;gkejhegjepksesmvr;ihbjrdjbz;rvri;vr;gzr"
      ";hjvzdrrjdzjrbgzjird;rvrzidzh;jvrkb;zzhbrjmvzrihjzurh"
      "gv;zmdvdznigbrvzmo;bfzdbrjvrvefgo;hrgorehglreaghmripeugUW9WFJEVRMBPARJGPI 84807QY-TUJ--[-R0GW9T4ty78w4y2"
      "pfhaevmdsz;blkbhudrhgohs45qa7063w7FPVwepg;EgP8E4ATPWF;KRZ9GU;SES8P93W7AWRHOVSEGPAW9TJAWV;SDKLNl:hL UHJKND;?:O"
      "GejpsOP 8jggije;szgohrghwe;ofjzezdrlnzlsrghlnrgluhvnmbzkf;rvdrhij;rvkzdr;blrd;rrz;dbkeelagshzegzs;vha3a98"
      "5ypawotw7yveoaovhldjxn hrdldg8e4wpwac;SVMSRLGha488ptgspz4t88t40hgd9zgodirgnjdzgjd;hjrdjpgjpjzd;kj;vrb"
      ",ljrdhdjllhjrdlglzrdhzdipgdzlplzkbbngx ljgbfmg;nlkzgnmfbglnfv jbxlb;xgkh.mbklbkzbfbkOE\"";

  String getHashTemp(int requestTime, String requestBody) {
    String requestStr = '0xffee2235$requestBody';
    String input = '$requestTime $requestStr';

    int n = hackForHack.length;
    int x = requestTime % n;
    for (int i = 0; i < 13; i++) {
      x = getRnd(x) % n;
      input = input + hackForHack[x];
    }

    List<int> bytes = utf8.encode(input);
    Digest digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<void> onRequest(options, handler) async {
    if (endpoints.contains(options.path)) {
      final timeStamp = await _getTimeFromWeb();

      final jsonData = json.encode(options.data);
      final token = getHashTemp(timeStamp.millisecondsSinceEpoch, jsonData);

      // название хедеров для консперации
      options.headers['TEMP-USER-ID'] = timeStamp.millisecondsSinceEpoch;
      options.headers['SECOND-UUID'] = token;
    }
    return super.onRequest(options, handler);
  }

  Future<DateTime> _getTimeFromWeb() async {
    /// время по Гринвичу
    try {
      final resp = await dio.get(
          'https://worldtimeapi.org/api/timezone/Etc/UTC');
      final dateTime = resp.data["datetime"];
      return DateTime.parse(dateTime);
    } catch (e){
      return DateTime.now();
    }
  }
}