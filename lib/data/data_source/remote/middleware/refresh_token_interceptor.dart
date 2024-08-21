import 'package:injectable/injectable.dart';
import 'package:w_navigator/data/data_source/remote/middleware/base/base_interceptor.dart';

@LazySingleton()
class RefreshTokenInterceptor extends BaseInterceptor {
  @override
  int get priority => BaseInterceptor.refreshTokenPriority;

  // TODO: add refresh token interceptor here
}
