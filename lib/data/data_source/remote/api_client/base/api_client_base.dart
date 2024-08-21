import 'package:dio/dio.dart';

import 'package:w_navigator/data/data_source/remote/api_client/base/api_client_constants.dart';
import 'package:w_navigator/data/data_source/mapper/error/base_response_error.dart';
import 'package:w_navigator/data/data_source/mapper/exception/dio_exception_mapper.dart';
import 'package:w_navigator/data/data_source/mapper/success/base_response_success.dart';
import 'package:w_navigator/helper/constants/type_of_constants.dart';

enum RestMethod { get, post, put, patch, delete }

class RestApiClient {
  RestApiClient({
    required this.dio,
    this.errorResponseMapperType = ApiClientConstants.defaultErrorMapper,
    this.successResponseMapperType = ApiClientConstants.defaultResponseMapper,
  });

  final ResponseSuccessType successResponseMapperType;
  final ResponseErrorType errorResponseMapperType;
  final Dio dio;

  Future<T?> request<D extends Object, T extends Object>({
    required RestMethod method,
    required String path,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Decoder<D>? decoder,
    ResponseSuccessType? successResponseMapperType,
    ResponseErrorType? errorResponseMapperType,
    Options? options,

    // this token use for real time change inquiry
    CancelToken? cancelToken,
  }) async {
    assert(
      method != RestMethod.get ||
          (successResponseMapperType ?? this.successResponseMapperType) ==
              ResponseSuccessType.plain ||
          decoder != null,
      'decoder must not be null if method is GET',
    );

    try {
      final response = await _requestByMethod(
        method: method,
        path: path.startsWith(dio.options.baseUrl)
            ? path.substring(dio.options.baseUrl.length)
            : path,
        queryParameters: queryParameters,
        body: body,
        options: Options(
          headers: options?.headers,
          contentType: options?.contentType,
          responseType: options?.responseType,
          sendTimeout: options?.sendTimeout,
          receiveTimeout: options?.receiveTimeout,
        ),
      );

      if (response.data == null) {
        return null;
      }

      return BaseResponseSuccessMapper<D, T>.fromType(
        successResponseMapperType ?? this.successResponseMapperType,
      ).map(
        response: response.data,
        decoder: decoder,
      );
    } catch (error) {
      throw DioExceptionMapper(
        BaseResponseErrorMapper.fromType(
          errorResponseMapperType ?? this.errorResponseMapperType,
        ),
      ).map(error);
    }
  }

  Future<Response<dynamic>> _requestByMethod({
    required RestMethod method,
    required String path,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Options? options,
    CancelToken? cancelToken,
  }) {
    switch (method) {
      case RestMethod.get:
        return dio.get(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
      case RestMethod.post:
        return dio.post(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
      case RestMethod.patch:
        return dio.patch(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
      case RestMethod.put:
        return dio.put(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
      case RestMethod.delete:
        return dio.delete(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
    }
  }
}
