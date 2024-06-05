import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoadingNotifier extends StateNotifier<bool> {
  LoadingNotifier() : super(false);

  startLoading() {
    state = true;
  }

  stopLoading() {
    state = false;
  }
}

final loadingNotifierProvider =
    StateNotifierProvider<LoadingNotifier, bool>((ref) {
  return LoadingNotifier();
});

class FailureNotifier extends StateNotifier<bool> {
  FailureNotifier() : super(false);

  isError() {
    state = true;
  }

  fixError() {
    state = false;
  }
}

final failureNotifierProvider =
    StateNotifierProvider<FailureNotifier, bool>((ref) {
  return FailureNotifier();
});
