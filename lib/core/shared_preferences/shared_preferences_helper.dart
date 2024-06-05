
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesHelper(this._sharedPreferences);

  Future<void> setUserToken(String? userToken) async {
    if (userToken != null) {
      await _sharedPreferences.setString(
        _SharedPreferencesKeys.userToken,
        userToken,
      );
    } else {
      _sharedPreferences.remove(_SharedPreferencesKeys.userToken);
    }
  }

  String? getUserToken() {
    return _sharedPreferences.getString(
      _SharedPreferencesKeys.userToken,
    );
  }
}

class _SharedPreferencesKeys {
  static const String userToken = "user_token";
}
