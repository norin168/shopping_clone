import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:w_navigator/data/data_source/remote/middleware/base/base_interceptor.dart';

@Injectable()
class ConnectivityInterceptor extends BaseInterceptor {
  ConnectivityInterceptor(this._connectivity);
  final Connectivity _connectivity;

  @override
  int get priority => BaseInterceptor.connectivityPriority;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final List<ConnectivityResult> connectivityResult =
        await (_connectivity.checkConnectivity());

    if (connectivityResult.containsAll([
      ConnectivityResult.none,
      ConnectivityResult.other,
      // ConnectivityResult.ethernet,
      // ConnectivityResult.vpn
    ])) {
      return handler.reject(
        DioException(
          requestOptions: options,
          // error: const RemoteException(kind: RemoteExceptionKind.noInternet),
        ),
      );
    }

    return super.onRequest(options, handler);
  }
}
