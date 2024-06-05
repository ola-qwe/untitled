import 'package:dio/dio.dart';
import 'package:untitled/feature/authorization/data/data_source/authorization_data_source.dart';

import 'package:untitled/feature/authorization/data/repository/authorization_repository.dart';
import 'package:untitled/feature/authorization/data/responce/sign_in_responce.dart';

class AuthorizationRepositoryImplementer implements AuthorizationRepository {
  final AuthorizationRemoteDataSource authorizationRemoteDataSource;

  AuthorizationRepositoryImplementer({
    required this.authorizationRemoteDataSource,
  });

  @override
  Future<SignInResponse> signIn({
    required String username,
    required String password,
    int? expiresInMins,
  }) {
    return authorizationRemoteDataSource.signIn(
        username: username, password: password, expiresInMins: expiresInMins);
  }
}
