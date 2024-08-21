import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:w_navigator/helper/base/bloc/bloc_base.dart';
import 'package:w_navigator/presentation/auth/logout/bloc/logout_state.dart';

part 'logout_event.dart';

@Injectable()
class LogoutBloc extends BaseBloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutState()) {
    on<LogoutEvent>((event, emit) => switch (event) {
          _OnInitial _ => _onInitial(event, emit),
        });
  }

  FutureOr<void> _onInitial(
    _OnInitial event,
    Emitter<LogoutState> emit,
  ) async {
    // on initial
  }
}
