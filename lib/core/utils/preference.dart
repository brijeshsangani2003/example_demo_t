import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Preferences._();
  static final Preferences _instance = Preferences._();
  static SharedPreferences? _shared;

  final String _localeKey = 'locale';

  static Future<void> init() async {
    _shared = await SharedPreferences.getInstance();
  }

  set locale(String? value) {
    if (value == null) return;
    _shared?.setString(_localeKey, value);
  }

  String? get locale => _shared?.getString(_localeKey);

  static Preferences get instance => _instance;
}

Preferences preferences = Preferences.instance;
