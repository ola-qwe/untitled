import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled/feature/authorization/data/data_source/authorization_data_source.dart';
import 'package:untitled/feature/authorization/data/responce/sign_in_responce.dart';
import 'package:untitled/feature/authorization/domain/repository/authorization_repository_implementer.dart';

class MockAuthorizationRemoteDataSource extends Mock
    implements AuthorizationRemoteDataSource {}

void main() {
  late AuthorizationRepositoryImplementer repository;
  late MockAuthorizationRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockAuthorizationRemoteDataSource();
    repository = AuthorizationRepositoryImplementer(
      authorizationRemoteDataSource: mockDataSource,
    );
  });

  group('AuthorizationRepositoryImplementer', () {
    test('signIn should return SignInResponse', () async {
      // Arrange
      const username = 'testuser';
      const password = 'testpassword';
      const expiresInMins = 60;

      final expectedResponse = SignInResponse(token: 'testtoken', id: 3,username: "ola");

      when(mockDataSource.signIn(
        username: username,
        password: password,
        expiresInMins: anyNamed('expiresInMins'),
      )).thenAnswer((_) async => expectedResponse);

      // Act
      final result = await repository.signIn(
        username: username,
        password: password,
        expiresInMins: expiresInMins,
      );

      // Assert
      verify(mockDataSource.signIn(
        username: username,
        password: password,
        expiresInMins: expiresInMins,
      )).called(1);
      expect(result, equals(expectedResponse));
    });
  });
}