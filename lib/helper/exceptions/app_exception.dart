abstract class AppException implements Exception {
  final AppExceptionType appExceptionType;

  AppException(this.appExceptionType);
}

enum AppExceptionType {
  remote,
  parse,
  remoteConfig,
  uncaught,
  validation,
}
