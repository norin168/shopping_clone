import 'package:w_navigator/data/data_source/mapper/error/base_response_error.dart';
import 'package:w_navigator/helper/exceptions/app_exception.dart';

enum RemoteExceptionType {
  noInternet,

  /// host not found, cannot connect to host, SocketException
  network,

  /// server has defined response
  serverDefined,

  /// server has not defined response
  serverUndefined,

  /// Caused by an incorrect certificate as configured by [ValidateCertificate]
  badCertificate,

  /// error occurs when passing JSON
  decodeError,

  refreshTokenFailed,
  timeout,
  cancellation,
  unknown,
}

class RemoteException extends AppException {
  RemoteException({
    required this.type,
    this.serverError,
    this.rootException,
    this.httpErrorCode,
  }) : super(AppExceptionType.remote);

  final RemoteExceptionType type;
  final ServerError? serverError;
  final Object? rootException;
  final int? httpErrorCode;

  @override
  String toString() {
    return '''RemoteException: {
      type: $type 
      serverError: $serverError,
      rootException: $rootException, 
      httpErrorCode: $httpErrorCode,
      stackTrace: ${rootException is Error ? (rootException as Error).stackTrace : ''}
}''';
  }
}
