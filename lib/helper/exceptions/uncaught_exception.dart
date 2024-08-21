import 'package:w_navigator/helper/exceptions/app_exception.dart';

class AppUncaughtException extends AppException {
  AppUncaughtException(this.error) : super(AppExceptionType.uncaught);

  final dynamic error;

  @override
  String toString() {
    return 'appUncatchError: $error';
  }
}
