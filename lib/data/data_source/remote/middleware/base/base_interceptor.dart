import 'package:dio/dio.dart';

abstract class BaseInterceptor extends InterceptorsWrapper {
  static const retryOnErrorPriority = 100; // add first
  static const connectivityPriority = 99; // add second
  static const basicAuthPriority = 40;
  static const refreshTokenPriority = 30;
  static const accessTokenPriority = 20;
  static const headerPriority = 19;
  static const contentTypePriority = 10;
  static const logPriority = 1; // add last

  /// higher, add first
  /// lower, add last
  int get priority;
}
