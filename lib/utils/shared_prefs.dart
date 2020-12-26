import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _sharedPrefs;
  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

  String get username => _sharedPrefs.getString('displayName') ?? "";

  // set username(String value) {
  //   _sharedPrefs.setString(keyUsername, value);
  // }
}

final sharedPrefs = SharedPrefs();
