abstract class AppRepository {
  bool get isLoggedIn;

  bool get isFirstLunchApp;

  bool get isFirstLogin;

  String get getThemeMode;

  Future<void> login({
    required String username,
    required String password,
  });

  Future<void> logout();

  Future<void> resetPassword({
    required String token,
    required String email,
    required String password,
    required String confirmPassword,
  });

  Future<void> forgotPassword(String email);

  Future<void> register({
    required String username,
    required String email,
    required String password,
    required String gender,
  });

  // User getUserPreference();

  Future<void> clearCurrentUserData();

  Future<bool> saveIsFirstLogin(bool isFirstLogin);

  Future<bool> saveIsFirstLaunchApp(bool isFirstLaunchApp);

  // Future<PagedList<User>> getUsers({
  //   required int page,
  //   required int? limit,
  // });

  Future<bool> saveIsDarkMode(bool isDarkMode);

  // Future<bool> saveLanguageCode(LanguageCode languageCode);

  Future<void> saveAccessToken(String accessToken);

  // Future<bool> saveUserPreference(User user);

  // Future<User> getMe();

  // int putLocalUser(User user);

  // Stream<List<User>> getLocalUsersStream();

  // List<User> getLocalUsers();

  // User? getLocalUser(int id);

  bool deleteImageUrl(int id);

  int deleteAllUsersAndImageUrls();
}
