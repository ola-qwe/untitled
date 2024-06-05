import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled/feature/authorization/data/data_source/authorization_data_source.dart';
import 'package:untitled/feature/authorization/data/responce/sign_in_responce.dart';

class MockAuthorizationRemoteDataSource extends Mock
    implements AuthorizationRemoteDataSource {}

void main() {
  late AuthorizationRemoteDataSource dataSource;
  late MockAuthorizationRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockAuthorizationRemoteDataSource();
    dataSource = mockDataSource;
  });

  group('AuthorizationRemoteDataSource', () {
    test('signIn should return SignInResponse', () async {
      // Arrange
      const username = 'testuser';
      const password = 'testpassword';
      const expiresInMins = 120;

      final expectedResponse = SignInResponse(token: 'testtoken', id: 2,username: "olaa");

      when(mockDataSource.signIn(
        username: username,
        password: password,
        expiresInMins: anyNamed('expiresInMins'),
      )).thenAnswer((_) async => expectedResponse);

      // Act
      final result = await dataSource.signIn(
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