import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Singleton simple para usarlo en toda la app
final AppSettingsController appSettings = AppSettingsController();

class AppSettingsController extends ChangeNotifier {
  static const _kDarkKey = 'liisgo_isDark';
  static const _kLocaleKey = 'liisgo_locale';

  bool _isDark = false;
  Locale _locale = const Locale('es');

  bool get isDark => _isDark;
  Locale get locale => _locale;

  /// ✅ Carga preferencias guardadas (llamar antes de runApp)
  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    _isDark = prefs.getBool(_kDarkKey) ?? false;

    final savedLang = prefs.getString(_kLocaleKey);
    if (savedLang != null && savedLang.isNotEmpty) {
      _locale = Locale(savedLang);
    }

    notifyListeners();
  }

  /// ✅ Cambia tema y guarda
  Future<void> toggleDark(bool value) async {
    _isDark = value;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kDarkKey, _isDark);
  }

  /// ✅ Cambia idioma y guarda
  Future<void> setLocale(Locale value) async {
    _locale = value;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kLocaleKey, _locale.languageCode);
  }
}
