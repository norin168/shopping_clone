// import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:w_navigator/data/data_source/remote/middleware/base/base_interceptor.dart';

@Injectable()
class HeaderInterceptor extends BaseInterceptor {
  // HeaderInterceptor(this._appInfo);

  Map<String, dynamic> _headers = {};
  // final AppInfo _appInfo;

  @override
  int get priority => BaseInterceptor.headerPriority;

  set headers(Map<String, dynamic> headers) => _headers = headers;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // final userAgentValue = userAgentClientHintsHeader();
    // options.headers[ServerRequestResponseConstants.userAgentKey] =
    //     userAgentValue;
    options.headers.addAll(_headers);

    handler.next(options);
  }

  // String userAgentClientHintsHeader() {
  //   return '${Platform.operatingSystem} - ${_appInfo.versionName}(${_appInfo.versionCode})';
  // }
}
