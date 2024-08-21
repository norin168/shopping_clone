import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:w_navigator/data/data_source/local/shared_preference_handler.dart';

@LazySingleton()
class SecureStorageHandler {
  const SecureStorageHandler(this._flutterSecureStorage);

  final FlutterSecureStorage _flutterSecureStorage;

  Future<String> get getAccessToken async =>
      await _flutterSecureStorage.read(key: PreferenceConstants.accessToken) ??
      '';

  Future<String?> get getRefreshToken async =>
      await _flutterSecureStorage.read(key: PreferenceConstants.refreshToken);

  Future<void> saveAccessToken(String token) async =>
      await _flutterSecureStorage.write(
          key: PreferenceConstants.accessToken, value: token);

  Future<void> saveRefreshToken(String token) async =>
      await _flutterSecureStorage.write(
          key: PreferenceConstants.refreshToken, value: token);

  Future<void> clearAllUserData() async {
    await Future.wait([
      _flutterSecureStorage.delete(key: PreferenceConstants.accessToken),
      _flutterSecureStorage.delete(key: PreferenceConstants.refreshToken),
    ]);
  }
}
