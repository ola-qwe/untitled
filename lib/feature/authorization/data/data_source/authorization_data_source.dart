
import 'package:untitled/feature/authorization/data/responce/sign_in_responce.dart';

abstract class AuthorizationRemoteDataSource {


  Future<SignInResponse> signIn({
    required String username,
    required String password,
    int? expiresInMins,
  });

}
