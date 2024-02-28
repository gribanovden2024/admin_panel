import 'package:admin_panel/interseptor/profile/model/auth_request.dart';
import 'package:admin_panel/interseptor/profile/model/auth_response.dart';
import 'package:admin_panel/interseptor/profile/profile_url.dart';
import 'package:admin_panel/interseptor/profile/teacher_profile/data/dto/free_token_dto.dart';
import 'package:admin_panel/interseptor/profile/teacher_profile/data/dto/token_free_request_dto.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

part 'profile_service.g.dart';

@RestApi()
abstract class ProfileService {
  factory ProfileService(Dio dio, {String baseUrl}) = _ProfileService;

  @POST(ProfileUrl.passwordLogin)
  Future<AuthResponse> postAuthPasswordLogin({
    @Body() required AuthRequest request,
  });

  @POST(ProfileUrl.freeToken)
  Future<FreeTokenDto> postTokenFree({
    @Body() required TokenFreeRequestDto request,
  });
}
