
import 'package:untitled/feature/authorization/data/data_source/authorization_data_source.dart';
import 'package:untitled/feature/authorization/data/network/authorization_api_client.dart';
import 'package:untitled/feature/authorization/data/responce/sign_in_responce.dart';

class AuthorizationRemoteDataSourceImplementer
    implements AuthorizationRemoteDataSource {
  final AuthorizationApiClient signInApiClient;

  AuthorizationRemoteDataSourceImplementer({required this.signInApiClient});

  @override
  Future<SignInResponse> signIn({
    required String username,
    required String password,
    int? expiresInMins,
  }) {
    return signInApiClient.signIn(
        signInRequest: SignInRequest(
            password: password,
            username: username,
            expiresInMins: expiresInMins));
  }
}
