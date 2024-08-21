import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_navigator/app/bloc/app_bloc.dart';
import 'package:w_navigator/helper/base/bloc/bloc_mixin.dart';
import 'package:w_navigator/helper/base/common_bloc/common_bloc.dart';
import 'package:w_navigator/helper/base/common_bloc/common_event.dart';
import 'package:w_navigator/helper/log/log.dart';
import 'package:w_navigator/helper/navigator/app_navigator/app_navigator.dart';

abstract class BaseBloc<E extends BaseBlocEvent, S extends BaseBlocState>
    extends BaseBlocDelegate<E, S> with EventTransformerMixin, LogMixin {
  BaseBloc(super.initialState);
}

abstract interface class BaseBlocDelegate<E extends BaseBlocEvent,
    S extends BaseBlocState> extends Bloc<E, S> {
  BaseBlocDelegate(super.initialState);

  late final AppBloc appBloc;
  late final AppNavigator navigator;
  late final CommonBloc _commonBloc;

  set commonBloc(CommonBloc commonBloc) => _commonBloc = commonBloc;
  CommonBloc get commonBloc =>
      this is CommonBloc ? this as CommonBloc : _commonBloc;

  @override
  void add(E event) {
    if (!isClosed) {
      super.add(event);
    } else {
      Log.e('Cannot add new event $event because $runtimeType was closed');
    }
  }

  Future<void> runBlocCatching({
    required Future<void> Function() action,
    Future<void> Function()? doOnRetry,
    // Future<void> Function(AppException)? doOnError,
    Future<void> Function()? doOnSubscribe,
    Future<void> Function()? doOnSuccessOrError,
    Future<void> Function()? doOnEventCompleted,
    bool handleLoading = true,
    bool handleError = true,
    bool handleRetry = true,
    // bool Function(AppException)? forceHandleError,
    String? overrideErrorMessage,
    int? maxRetries,
  }) async {
    assert(maxRetries == null || maxRetries > 0, 'maxRetries must be positive');

    Completer<void>? recursion;

    try {
      await doOnSubscribe?.call();
      if (handleLoading) {
        showLoading();
      }

      await action.call();

      if (handleLoading) {
        hideLoading();
      }
      await doOnSuccessOrError?.call();
    } catch (e) {
      Log.e('onCatchError: $e');
      // TODO: Make the error handler with similar code base
      // } on AppException catch (e) {
      // if (handleLoading) {
      //   hideLoading();
      // }
      // await doOnSuccessOrError?.call();
      // await doOnError?.call(e);

      // if (handleError || (forceHandleError?.call(e) ?? _forceHandleError(e))) {
      //   await addException(AppExceptionWrapper(
      //     appException: e,
      //     doOnRetry: doOnRetry ??
      //         (handleRetry && maxRetries != 1
      //             ? () async {
      //                 recursion = Completer();
      //                 await runBlocCatching(
      //                   action: action,
      //                   doOnEventCompleted: doOnEventCompleted,
      //                   doOnSubscribe: doOnSubscribe,
      //                   doOnSuccessOrError: doOnSuccessOrError,
      //                   doOnError: doOnError,
      //                   doOnRetry: doOnRetry,
      //                   forceHandleError: forceHandleError,
      //                   handleError: handleError,
      //                   handleLoading: handleLoading,
      //                   handleRetry: handleRetry,
      //                   overrideErrorMessage: overrideErrorMessage,
      //                   maxRetries: maxRetries?.minus(1),
      //                 );
      //                 recursion?.complete();
      //               }
      //             : null),
      //     exceptionCompleter: Completer<void>(),
      //     overrideMessage: overrideErrorMessage,
      //   ));
      // }
    } finally {
      await recursion?.future;
      await doOnEventCompleted?.call();
    }
  }

  void showLoading() {
    commonBloc.add(const OnChangeLoadingVisibility(loading: true));
  }

  void hideLoading() {
    commonBloc.add(const OnChangeLoadingVisibility(loading: false));
  }
}

abstract class BaseBlocEvent {
  const BaseBlocEvent();
}

abstract class BaseBlocState {
  const BaseBlocState();
}
