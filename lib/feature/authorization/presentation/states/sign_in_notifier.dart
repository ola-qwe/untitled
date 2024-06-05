import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:untitled/dependency_injection/service_locator.dart';
import 'package:untitled/feature/authorization/data/repository/authorization_repository.dart';
import 'package:untitled/feature/authorization/data/responce/sign_in_responce.dart';
import 'package:untitled/feature/authorization/presentation/states/loading_notifier.dart';

class SignInNotifier extends StateNotifier<SignInResponse?> {
  SignInNotifier({required this.ref, required this.authorizationRepository})
      : super(null);
  final AuthorizationRepository authorizationRepository;
  final StateNotifierProviderRef<SignInNotifier, SignInResponse?> ref;

 void signIn(String username, String password) {
    final load=ref.read(loadingNotifierProvider.notifier);
    try {
      load.startLoading();
      final result = authorizationRepository.signIn(
          username: username, password: password);
      load.stopLoading();
    } catch (e) {
      load.stopLoading();
      print("error");
    }
  }
}

final signInNotifierNotifierProvider =
    StateNotifierProvider<SignInNotifier, SignInResponse?>((ref) {
  return SignInNotifier(
    ref: ref,
    authorizationRepository: getIt<AuthorizationRepository>(),
  );
});
