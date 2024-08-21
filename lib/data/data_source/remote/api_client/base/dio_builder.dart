import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:w_navigator/data/data_source/remote/api_client/base/api_client_constants.dart';
import 'package:w_navigator/data/data_source/remote/middleware/base/base_interceptor.dart';
import 'package:w_navigator/data/data_source/remote/middleware/content_type_json_interceptor.dart';

class DioBuilder {
  const DioBuilder._();
  static Dio createDio({
    BaseOptions? options,
    List<Interceptor> interceptors = const [],
  }) {
    final dio = Dio(
      BaseOptions(
        connectTimeout:
            options?.connectTimeout ?? ApiClientConstants.connectTimeout,
        receiveTimeout:
            options?.receiveTimeout ?? ApiClientConstants.receiveTimeout,
        sendTimeout: options?.sendTimeout ?? ApiClientConstants.sendTimeout,
        baseUrl: options?.baseUrl ?? ApiClientConstants.defaultBaseUrl,
      ),
    );

    final sortedInterceptors = [
      if (kDebugMode) LogInterceptor(),
      ContentTypeJsonInterceptor(),
      ...interceptors,
    ].sortedByDescending((element) {
      return element is BaseInterceptor ? element.priority : -1;
    });

    dio.interceptors.addAll(sortedInterceptors);

    return dio;
  }
}
