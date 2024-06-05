import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:untitled/core/ui/end_point.dart';
import 'package:untitled/feature/authorization/data/responce/sign_in_responce.dart';

part 'authorization_api_client.g.dart';

@RestApi()
abstract class AuthorizationApiClient {
  factory AuthorizationApiClient(Dio dio) = _AuthorizationApiClient;

  @POST(EndPoint.signIn)
  Future<SignInResponse> signIn({
    @Body() required SignInRequest signInRequest,
  });
}
