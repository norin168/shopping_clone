import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:w_navigator/data/data_source/remote/api_client/base/api_client_constants.dart';
import 'package:w_navigator/data/data_source/remote/middleware/base/base_interceptor.dart';

@LazySingleton()
class ContentTypeJsonInterceptor extends BaseInterceptor {
  @override
  int get priority => BaseInterceptor.contentTypePriority;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiClientConstants.contentType] = 'application/json';
    handler.next(options);
  }
}
