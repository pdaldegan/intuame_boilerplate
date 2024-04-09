import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  late SharedPreferences _prefs;
  late Locale _appLocale;

  LocaleProvider(SharedPreferences prefs, Locale initialLocale) {
    _prefs = prefs;
    _appLocale = initialLocale;
  }

  Locale get appLocale => _appLocale;

  Future<void> updateLocale(Locale newLocale) async {
    _appLocale = newLocale;
    await _prefs.setString('app_locale', _appLocale.languageCode);
    notifyListeners();
  }
}