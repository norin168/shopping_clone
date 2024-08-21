class UrlConstants {
  UrlConstants._();

  static String get baseNonAuthUrl =>
      const String.fromEnvironment('baseNonAuthUrl');

  static String get baseAuthUrl => const String.fromEnvironment('baseAuthUrl');
}
