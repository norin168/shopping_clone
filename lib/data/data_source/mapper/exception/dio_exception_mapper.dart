import 'dart:io';

import 'package:dio/dio.dart';
import 'package:w_navigator/data/data_source/mapper/error/base_response_error.dart';

import 'package:w_navigator/helper/exceptions/app_exception.dart';
import 'package:w_navigator/helper/exceptions/remote_exception.dart';

abstract class ExceptionMapper<T extends AppException> {
  T map(Object? exception);
}

class DioExceptionMapper extends ExceptionMapper<RemoteException> {
  DioExceptionMapper(this._errorResponseMapper);

  final BaseResponseErrorMapper<dynamic> _errorResponseMapper;

  @override
  RemoteException map(Object? exception) {
    if (exception is RemoteException) {
      return exception;
    }

    if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.cancel:
          return RemoteException(
            type: RemoteExceptionType.cancellation,
          );
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return RemoteException(
            type: RemoteExceptionType.timeout,
            rootException: exception,
          );
        case DioExceptionType.badResponse:
          final httpErrorCode = exception.response?.statusCode ?? -1;

          /// server-defined error
          if (exception.response?.data != null) {
            final serverError = _errorResponseMapper.map(
              exception.response!.data!,
            );

            return RemoteException(
              type: RemoteExceptionType.serverDefined,
              httpErrorCode: httpErrorCode,
              serverError: serverError,
            );
          }

          return RemoteException(
            type: RemoteExceptionType.serverUndefined,
            httpErrorCode: httpErrorCode,
            rootException: exception,
          );
        case DioExceptionType.badCertificate:
          return RemoteException(
            type: RemoteExceptionType.badCertificate,
            rootException: exception,
          );
        case DioExceptionType.connectionError:
          return RemoteException(
            type: RemoteExceptionType.network,
            rootException: exception,
          );
        case DioExceptionType.unknown:
          if (exception.error is SocketException) {
            return RemoteException(
              type: RemoteExceptionType.network,
              rootException: exception,
            );
          }

          if (exception.error is RemoteException) {
            return exception.error as RemoteException;
          }
      }
    }

    return RemoteException(
      type: RemoteExceptionType.unknown,
      rootException: exception,
    );
  }
}
