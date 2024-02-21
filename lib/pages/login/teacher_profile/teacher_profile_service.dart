import 'package:admin_panel/pages/login/teacher_profile/teacher_profile_url.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

import '../data/auth_response.dart';
import '../dto/email_part1_request/email_part1_request.dart';
import '../dto/email_part2_request/email_part2_request.dart';
import '../dto/free_token_dto.dart';
import '../dto/token_free_request_dto.dart';

part 'teacher_profile_service.g.dart';

@RestApi(baseUrl: 'https://vsu-stage.fittin.ru')
abstract class TeacherProfileService {
  factory TeacherProfileService(Dio dio, {String baseUrl}) =
      _TeacherProfileService;

  @POST(TeacherProfileUrl.emailPart1)
  Future<void> part1Email({
      // @Header("authorization") required String autor,
      // @Header("temp-user-id") required String time,
      // @Header("x-client-id") required String id,
      // @Header('x-client-os') required String os,
      @Body() required String request});

  @POST(TeacherProfileUrl.emailPart2)
  Future<AuthResponse> part2Email({@Body() required EmailPart2Request request});

  @POST(TeacherProfileUrl.freeToken)
  Future<FreeTokenDto> postTokenFree(
      {@Body() required TokenFreeRequestDto request});
}
