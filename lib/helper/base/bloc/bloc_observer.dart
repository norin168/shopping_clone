import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_navigator/helper/log/config.dart';
import 'package:w_navigator/helper/log/log.dart';

class AppBlocObserver extends BlocObserver with LogMixin {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (LogConfig.enabled) {
      Log.d('onChange $change', name: bloc.runtimeType.toString());
    }
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    if (LogConfig.enabled) {
      Log.d('created', name: bloc.runtimeType.toString());
    }
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    if (LogConfig.enabled) {
      Log.d('closed', name: bloc.runtimeType.toString());
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (LogConfig.enabled) {
      Log.d('onError $error', name: bloc.runtimeType.toString());
    }
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    if (LogConfig.enabled) {
      Log.d('onEvent $event', name: bloc.runtimeType.toString());
    }
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    if (LogConfig.enabled) {
      Log.d('onTransition $transition', name: bloc.runtimeType.toString());
    }
  }
}
