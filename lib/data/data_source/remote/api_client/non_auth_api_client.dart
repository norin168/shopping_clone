// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:w_navigator/data/data_source/remote/api_client/base/api_client_base.dart';
import 'package:w_navigator/data/data_source/remote/api_client/base/dio_builder.dart';
import 'package:w_navigator/data/data_source/remote/middleware/connectivity_interceptor.dart';
import 'package:w_navigator/data/data_source/remote/middleware/header_interceptor.dart';
import 'package:w_navigator/helper/constants/url_constants.dart';

@LazySingleton()
class NonAuthApiClient extends RestApiClient {
  NonAuthApiClient(
    HeaderInterceptor _headerInterceptor,
    ConnectivityInterceptor _connectivityInterceptor,
  ) : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: UrlConstants.baseNonAuthUrl),
            interceptors: [
              _headerInterceptor,
              _connectivityInterceptor,
            ],
          ),
        );
}
