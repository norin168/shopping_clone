import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:w_navigator/data/data_source/local/secure_storage_handler.dart';
import 'package:w_navigator/data/data_source/remote/api_client/base/api_client_constants.dart';
import 'package:w_navigator/data/data_source/remote/middleware/base/base_interceptor.dart';

@Injectable()
class AccessTokenInterceptor extends BaseInterceptor {
  final SecureStorageHandler _secureStorageHandler;

  AccessTokenInterceptor(this._secureStorageHandler);

  @override
  int get priority => BaseInterceptor.accessTokenPriority;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String acckessToken = await _secureStorageHandler.getAccessToken;
    if (acckessToken.isNotEmpty) {
      options.headers[ApiClientConstants.accessToken] = acckessToken;
    }

    handler.next(options);
  }
}
