import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:untitled/core/shared_preferences/shared_preferences_helper.dart';
import 'package:untitled/dependency_injection/service_locator.dart';
import 'package:untitled/feature/authorization/data/repository/authorization_repository.dart';
import 'package:untitled/feature/authorization/data/responce/sign_in_responce.dart';
import 'package:untitled/feature/authorization/presentation/states/sign_in_notifier.dart';

class MockAuthorizationRepository extends Mock
    implements AuthorizationRepository {}

class MockSignInResponse extends Mock implements SignInResponse {}

void main() {
  late SignInNotifier signInNotifier;
  late MockAuthorizationRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthorizationRepository();
    signInNotifier = SignInNotifier(
      ref: ProviderContainer().read(signInNotifierNotifierProvider as ProviderListenable<StateNotifierProviderRef<SignInNotifier, SignInResponse?>>),
      authorizationRepository: mockRepository,
      sharedPreferencesHelper: getIt<SharedPreferencesHelper>(),
    );
  });

  group('SignInNotifier', () {
    test('signIn should update state and save user token on successful sign in',
        () async {
      // Arrange
      final mockSignInResponse = MockSignInResponse();
      const username = 'testuser';
      const password = 'testpassword';

      when(mockRepository.signIn(username:"ola", password: "qweder"))
          .thenAnswer((_) async => mockSignInResponse);

      // Act
      await signInNotifier.signIn(username, password);

      // Assert
      verify(mockRepository.signIn(username: username, password: password)).called(1);
      verify(mockSignInResponse.token).called(1);
      expect(signInNotifier.state, equals(mockSignInResponse));
    });

    test('signIn should handle error and update loading state on failure',
        () async {
      // Arrange
      const username = 'olaa';
      const password = 'qweder';

      when(mockRepository.signIn(username: username, password:password))
          .thenThrow(Exception('Test Error'));

      // Act
      await signInNotifier.signIn(username, password);

      // Assert
      verify(mockRepository.signIn(username: username, password: password)).called(1);
      expect(signInNotifier.state, isNull);
    });
  });
}