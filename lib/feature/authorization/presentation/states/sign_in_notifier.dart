import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:untitled/core/shared_preferences/shared_preferences_helper.dart';
import 'package:untitled/dependency_injection/service_locator.dart';
import 'package:untitled/feature/authorization/data/repository/authorization_repository.dart';
import 'package:untitled/feature/authorization/data/responce/sign_in_responce.dart';
import 'package:untitled/feature/authorization/presentation/states/loading_notifier.dart';

class SignInNotifier extends StateNotifier<SignInResponse?> {
  SignInNotifier({required this.ref, required this.authorizationRepository,
  required this.sharedPreferencesHelper})
      : super(null);
  final AuthorizationRepository authorizationRepository;
  final StateNotifierProviderRef<SignInNotifier, SignInResponse?> ref;
  final SharedPreferencesHelper sharedPreferencesHelper;

 Future<void> signIn(String username, String password) async {
    final load=ref.read(loadingNotifierProvider.notifier);
    final error=ref.read(failureNotifierProvider.notifier);
    try {
      load.startLoading();
      error.fixError();
      final result =await  authorizationRepository.signIn(
          username: username, password: password);
      state=result;
      sharedPreferencesHelper.setUserToken(result.token);
      load.stopLoading();
    } catch (e) {
      load.stopLoading();
      error.isError();
    }
  }
}

final signInNotifierNotifierProvider =
    StateNotifierProvider<SignInNotifier, SignInResponse?>((ref) {
  return SignInNotifier(
    ref: ref,
    authorizationRepository: getIt<AuthorizationRepository>(),
    sharedPreferencesHelper:getIt<SharedPreferencesHelper>(),
  );
});
