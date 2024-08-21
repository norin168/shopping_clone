import 'package:dio/dio.dart';
import 'package:w_navigator/data/data_source/remote/middleware/base/base_interceptor.dart';
import 'package:w_navigator/helper/log/config.dart';
import 'package:w_navigator/helper/log/log.dart';

class LogInterceptor extends BaseInterceptor {
  @override
  int get priority => BaseInterceptor.logPriority;

  static const _enableLogInterceptor = LogConfig.logApiClient;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!_enableLogInterceptor) {
      handler.next(options);

      return;
    }
    final log = <String>[];
    log.add('************ Request ************');
    log.add('🌐 Request: ${options.method} ${options.uri}');
    if (options.headers.isNotEmpty) {
      log.add('🌐 Request Headers:');
      log.add('🌐 ${_prettyResponse(options.headers)}');
    }

    if (options.data != null) {
      log.add('🌐 Request Body:');
      if (options.data is FormData) {
        final data = options.data as FormData;
        if (data.fields.isNotEmpty) {
          log.add('🌐 Fields: ${_prettyResponse(data.fields)}');
        }
        if (data.files.isNotEmpty) {
          log.add(
            '🌐 Files: ${_prettyResponse(data.files.map((e) => MapEntry(e.key, 'File name: ${e.value.filename}, Content type: ${e.value.contentType}, Length: ${e.value.length}')))}',
          );
        }
      } else {
        log.add('🌐 ${_prettyResponse(options.data)}');
      }
    }

    Log.d(log.join('\n'));
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!_enableLogInterceptor) {
      handler.next(response);

      return;
    }

    final log = <String>[];

    log.add('************ Request Response ************');
    log.add(
      '🎉 ${response.requestOptions.method} ${response.requestOptions.uri}',
    );
    log.add(
        '🎉 Request Body: ${_prettyResponse(response.requestOptions.data)}');
    log.add('🎉 Success Code: ${response.statusCode}');
    log.add('🎉 ${_prettyResponse(response.data)}');

    Log.d(log.join('\n'));
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!_enableLogInterceptor) {
      handler.next(err);

      return;
    }

    final log = <String>[];

    log.add('************ Request Error ************');
    log.add('⛔️ ${err.requestOptions.method} ${err.requestOptions.uri}');
    log.add(
        '⛔️ Error Code: ${err.response?.statusCode ?? 'unknown status code'}');
    log.add('⛔️ Json: ${err.response}');

    Log.e(log.join('\n'));
    handler.next(err);
  }

  // ignore: avoid-dynamic
  String _prettyResponse(dynamic data) {
    if (data is Map) {
      return Log.prettyJson(data as Map<String, dynamic>);
    }

    return data.toString();
  }
}
