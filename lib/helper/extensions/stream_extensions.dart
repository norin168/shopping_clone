import 'package:rxdart/rxdart.dart';
import 'package:w_navigator/helper/log/config.dart';
import 'package:w_navigator/helper/log/log.dart';

extension StreamExtensions<T> on Stream<T> {
  Stream<T> log(
    String name, {
    bool logOnListen = false,
    bool logOnData = false,
    bool logOnError = false,
    bool logOnDone = false,
    bool logOnCancel = false,
  }) {
    return doOnListen(() {
      if (LogConfig.enabled && logOnListen) {
        Log.d('▶️ onSubscribed', time: DateTime.now(), name: name);
      }
    }).doOnData((event) {
      if (LogConfig.enabled && logOnData) {
        Log.d('🟢 onEvent: ${event.runtimeType}',
            time: DateTime.now(), name: name);
      }
    }).doOnCancel(() {
      if (LogConfig.enabled && logOnCancel) {
        Log.d('🟡 onCanceled', time: DateTime.now(), name: name);
      }
    }).doOnError((e, _) {
      if (LogConfig.enabled && logOnError) {
        Log.e('🔴 onError $e', time: DateTime.now(), name: name);
      }
    }).doOnDone(() {
      if (LogConfig.enabled && logOnDone) {
        Log.d('☑️️ onCompleted', time: DateTime.now(), name: name);
      }
    });
  }
}
