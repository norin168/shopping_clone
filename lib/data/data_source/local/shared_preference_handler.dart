import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class SharedPreferenceHandler {
  final SharedPreferences _sharedPreferences;

  const SharedPreferenceHandler(this._sharedPreferences);

  bool get isFirstLogin =>
      _sharedPreferences.getBool(PreferenceConstants.isFirstLogin) ?? false;

  bool get isLoggedIn =>
      _sharedPreferences.getBool(PreferenceConstants.isLoggedIn) ?? false;

  bool get isFirstLaunch =>
      _sharedPreferences.getBool(PreferenceConstants.isFirstLaunch) ?? false;

  String get getLanguageCode =>
      _sharedPreferences.getString(PreferenceConstants.lanaugaeCode) ?? '';

  Future<bool> saveIsFirstLogin(bool value) async =>
      await _sharedPreferences.setBool(PreferenceConstants.isFirstLogin, value);

  Future<bool> saveIsLoggedIn(bool value) async =>
      await _sharedPreferences.setBool(PreferenceConstants.isLoggedIn, value);

  Future<bool> saveIsFirstlaunch(bool value) async => await _sharedPreferences
      .setBool(PreferenceConstants.isFirstLaunch, value);

  Future<bool> saveLanguageCode(String value) async => await _sharedPreferences
      .setString(PreferenceConstants.lanaugaeCode, value);
}

class PreferenceConstants {
  const PreferenceConstants._();
  static const String isLoggedIn = 'isLoggedIn';
  static const String isFirstLogin = 'isFirstLogin';
  static const String isFirstLaunch = 'isFirstLaunch';
  static const String lanaugaeCode = 'languageCode';

  static const String accessToken = 'accessToken';
  static const String refreshToken = 'refeshToken';
}
