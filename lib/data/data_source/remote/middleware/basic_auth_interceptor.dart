import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:w_navigator/data/data_source/remote/api_client/base/api_client_constants.dart';
import 'package:w_navigator/data/data_source/remote/middleware/base/base_interceptor.dart';

@LazySingleton()
class BasicAuthInterceptor extends BaseInterceptor {
  @override
  int get priority => BaseInterceptor.basicAuthPriority;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    const String username = '';
    const String password = '';

    options.headers[ApiClientConstants.basicAuth] =
        _basicAuthenticationHeader(username, password);

    handler.next(options);
  }

  String _basicAuthenticationHeader(String username, String password) {
    return 'Basic ${base64.encode(utf8.encode('$username:$password'))}';
  }
}
