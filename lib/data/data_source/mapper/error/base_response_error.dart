import 'package:w_navigator/data/data_source/mapper/error/app_error_response_mapper.dart';
import 'package:w_navigator/helper/exceptions/remote_exception.dart';

enum ResponseErrorType {
  jsonObject,
  jsonArray,
}

abstract class BaseResponseErrorMapper<T extends Object> {
  const BaseResponseErrorMapper();

  factory BaseResponseErrorMapper.fromType(ResponseErrorType type) {
    return switch (type) {
      ResponseErrorType.jsonObject =>
        JsonErrorMapper() as BaseResponseErrorMapper<T>,
      ResponseErrorType.jsonArray =>
        JsonArrayErrorMapper() as BaseResponseErrorMapper<T>,
    };
  }

  ServerError map(dynamic responseError) {
    try {
      if (responseError is! T) {
        throw RemoteException(
          // optional data
          type: RemoteExceptionType.decodeError,
          rootException: 'Response $responseError is not $T',
        );
      }

      return mapToDataModel(responseError);
    } on RemoteException catch (_) {
      rethrow;
    } catch (e) {
      throw RemoteException(
        type: RemoteExceptionType.decodeError,
        rootException: e,
      );
    }
  }

  ServerError mapToDataModel(dynamic responseError);
}

class ServerError {
  String? status;
  String? message;
  int? code;

  List<dynamic>? errors;

  ServerError({
    this.code,
    this.message,
    this.status,
    this.errors,
  });
}
