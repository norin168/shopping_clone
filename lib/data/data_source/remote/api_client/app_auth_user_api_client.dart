// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:w_navigator/data/data_source/remote/api_client/base/api_client_base.dart';
import 'package:w_navigator/data/data_source/remote/api_client/base/dio_builder.dart';
import 'package:w_navigator/data/data_source/remote/middleware/access_token_interceptor.dart';
import 'package:w_navigator/data/data_source/remote/middleware/basic_auth_interceptor.dart';
import 'package:w_navigator/data/data_source/remote/middleware/connectivity_interceptor.dart';
import 'package:w_navigator/data/data_source/remote/middleware/header_interceptor.dart';
import 'package:w_navigator/data/data_source/remote/middleware/refresh_token_interceptor.dart';
import 'package:w_navigator/helper/constants/url_constants.dart';

@LazySingleton()
class AuthApiClient extends RestApiClient {
  AuthApiClient(
    HeaderInterceptor _headerInterceptor,
    ConnectivityInterceptor _connectivityInterceptor,
    RefreshTokenInterceptor _refreshTokenInterceptor,
    BasicAuthInterceptor _baseAuthInterceptor,
    AccessTokenInterceptor _accessTokenInterceptor,
  ) : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: UrlConstants.baseAuthUrl),
            interceptors: [
              _headerInterceptor,
              _connectivityInterceptor,
              _baseAuthInterceptor,
              _refreshTokenInterceptor,
              _accessTokenInterceptor,
            ],
          ),
        );
}
