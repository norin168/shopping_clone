import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:w_navigator/helper/base/bloc/bloc_base.dart';
import 'package:w_navigator/helper/navigator/info/app_route_info.dart';
import 'package:w_navigator/presentation/splash/bloc/splash_state.dart';

part 'splash_event.dart';

@Injectable()
class SplashBloc extends BaseBloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashEvent>(
      (event, emit) => switch (event) {
        _OnInitial _ => _onInitial(event, emit),
      },
    );

    // in case no need data included
    // add(const SplashEvent.load());
  }

  FutureOr<void> _onInitial(
    _OnInitial event,
    Emitter<SplashState> emit,
  ) {
    const bool isUserLogin = false;

    // emit(state.copyWith(
    //   isUserLogin: isUserLogin,
    // ));

    Future.delayed(
      const Duration(seconds: 1),
      () async {
        if (isUserLogin) {
          navigator.replace(const AppRouteInfo.home(title: 'Welcome Back'));
        } else {
          // go to login screen
          await navigator.replace(const AppRouteInfo.login());
        }
      },
    );
  }
}
