import 'package:w_navigator/data/data_source/mapper/error/base_response_error.dart';
import 'package:w_navigator/data/data_source/mapper/success/base_response_success.dart';

class ApiClientConstants {
  const ApiClientConstants._();

  static const connectTimeout = Duration(seconds: 30);
  static const receiveTimeout = Duration(seconds: 30);
  static const sendTimeout = Duration(seconds: 30);

  static const defaultBaseUrl = '';

  // request
  static const acceptLanguage = 'Accept-Language';
  static const contentType = 'Content-Type';
  static const basicAuth = 'Basic-Auth';
  static const accessToken = 'Access-Token';
  static const refreshToken = 'Refresh-Token';

  // response
  static const defaultResponseMapper = ResponseSuccessType.jsonObject;
  static const defaultErrorMapper = ResponseErrorType.jsonObject;
}
