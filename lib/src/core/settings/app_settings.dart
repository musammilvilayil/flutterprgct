import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier {
  AppSettings._(this._prefs);
  final SharedPreferences _prefs;

  static const _darkKey = 'darkMode';
  static const _readAloudKey = 'readAloud';

  bool get isDark => _prefs.getBool(_darkKey) ?? false;
  bool get readAloud => _prefs.getBool(_readAloudKey) ?? true;

  static Future<AppSettings> load() async => AppSettings._(await SharedPreferences.getInstance());

  Future<void> setDark(bool value) async {
    await _prefs.setBool(_darkKey, value);
    notifyListeners();
  }

  Future<void> setReadAloud(bool value) async {
    await _prefs.setBool(_readAloudKey, value);
    notifyListeners();
  }
}
