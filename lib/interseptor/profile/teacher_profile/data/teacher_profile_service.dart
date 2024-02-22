import 'package:admin_panel/interseptor/profile/model/auth_response.dart';
import 'package:admin_panel/interseptor/profile/teacher_profile/data/dto/email_part1_request.dart';
import 'package:admin_panel/interseptor/profile/teacher_profile/data/dto/email_part2_request.dart';
import 'package:admin_panel/interseptor/profile/teacher_profile/data/dto/free_token_dto.dart';
import 'package:admin_panel/interseptor/profile/teacher_profile/data/dto/teacher_info_response.dart';
import 'package:admin_panel/interseptor/profile/teacher_profile/data/dto/token_free_request_dto.dart';
import 'package:admin_panel/interseptor/profile/teacher_profile/data/teacher_profile_url.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

part 'teacher_profile_service.g.dart';

@RestApi()
abstract class TeacherProfileService {
  factory TeacherProfileService(Dio dio, {String baseUrl}) =
      _TeacherProfileService;

  @POST(TeacherProfileUrl.emailPart1)
  Future<void> part1Email({
    @Body() required EmailPart1Request request,
  });

  @POST(TeacherProfileUrl.emailPart2)
  Future<AuthResponse> part2Email({
    @Body() required EmailPart2Request request,
  });

  @GET(TeacherProfileUrl.teacherInfo)
  Future<TeacherInfoResponse> getTeacherInfo();


  @POST(TeacherProfileUrl.freeToken)
  Future<FreeTokenDto> postTokenFree({
    @Body() required TokenFreeRequestDto request,
  });

  @DELETE(TeacherProfileUrl.user)
  Future<void> deleteTeacherProfile();

}
