import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  static late SharedPreferences _prefs;

  initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get token {
    return _prefs.getString('token') ?? '';
  }

  set token(value) {
    _prefs.setString('token', value);
  }
}
