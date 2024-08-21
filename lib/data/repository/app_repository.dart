import 'package:injectable/injectable.dart';
import 'package:w_navigator/data/data_source/local/secure_storage_handler.dart';
import 'package:w_navigator/data/data_source/local/shared_preference_handler.dart';
import 'package:w_navigator/domain/repository/app_repository.dart';

@LazySingleton(as: AppRepository)
class AppRepositoryImpl implements AppRepository {
  AppRepositoryImpl(this._secureStorageHandler, this._sharedPreferenceHandler);

  final SharedPreferenceHandler _sharedPreferenceHandler;
  final SecureStorageHandler _secureStorageHandler;

  @override
  Future<void> clearCurrentUserData() {
    throw UnimplementedError();
  }

  @override
  int deleteAllUsersAndImageUrls() {
    throw UnimplementedError();
  }

  @override
  bool deleteImageUrl(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> forgotPassword(String email) {
    throw UnimplementedError();
  }

  @override
  String get getThemeMode => throw UnimplementedError();

  @override
  bool get isFirstLogin => _sharedPreferenceHandler.isFirstLogin;

  @override
  bool get isFirstLunchApp => _sharedPreferenceHandler.isFirstLaunch;

  @override
  bool get isLoggedIn => _sharedPreferenceHandler.isLoggedIn;

  @override
  Future<void> login({required String username, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  @override
  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String gender,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword({
    required String token,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> saveAccessToken(String accessToken) async {
    await _secureStorageHandler.saveAccessToken(accessToken);
  }

  @override
  Future<bool> saveIsDarkMode(bool isDarkMode) {
    throw UnimplementedError();
  }

  @override
  Future<bool> saveIsFirstLaunchApp(bool isFirstLaunchApp) {
    throw UnimplementedError();
  }

  @override
  Future<bool> saveIsFirstLogin(bool isFirstLogin) {
    throw UnimplementedError();
  }
}
