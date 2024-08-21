import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:w_navigator/helper/base/bloc/bloc_base.dart';
import 'package:w_navigator/helper/validator/auth_validator.dart';
import 'package:w_navigator/presentation/auth/login/bloc/login_state.dart';

part 'login_event.dart';

@Injectable()
class LoginBloc extends BaseBloc<LoginEvent, LoginState>
    implements CardNumberChangeObserver {
  LoginBloc() : super(LoginState()) {
    on<LoginEvent>(
      (event, emit) => switch (event) {
        _OnInitial _ => _onInitial(event, emit),
        _OnClickSubmit _ => _onClickSubmit(event, emit),
        _OnUsernameChnge _ => _onUsernameChange(event, emit),
        _OnPasswordChange _ => _onPasswordChange(event, emit),
      },
      transformer: log(),
    );
  }

  @override
  void notifyChanged(String cardNumber) {
    add(LoginEvent.onUsernameChange(cardNumber));
  }

  @override
  Future<void> close() {
    appBloc.removeObserver(this);
    return super.close();
  }

  FutureOr<void> _onInitial(
    _OnInitial event,
    Emitter<LoginState> emit,
  ) async {
    // on initiald d
  }

  FutureOr<void> _onClickSubmit(
    _OnClickSubmit event,
    Emitter<LoginState> emit,
  ) async {
    showLoading();

    await Future.delayed(
      const Duration(seconds: 5),
      () {
        hideLoading();
      },
    );
  }

  FutureOr<void> _onUsernameChange(
    _OnUsernameChnge event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(username: event.username));
    // do on username change
  }

  FutureOr<void> _onPasswordChange(
    _OnPasswordChange event,
    Emitter<LoginState> emit,
  ) async {
    // do on password change
  }
}
