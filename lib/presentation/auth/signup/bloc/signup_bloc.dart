import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_navigator/helper/base/bloc/bloc_base.dart';
import 'package:w_navigator/presentation/auth/signup/bloc/signup_state.dart';

part 'signup_event.dart';

class SignupBloc extends BaseBloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState()) {
    on<SignupEvent>(
      (event, emit) => switch (event) {
        _OnInitial _ => _onInitial(event, emit),
        _OnClickSubmit _ => _onClickSubmit(event, emit),
        _OnUsernameChange _ => _onUsernameChange(event, emit),
        _OnPasswordChange _ => _onPasswordChange(event, emit),
        _OnPhoneNumberChange _ => _onPhoneNumberChange(event, emit),
        _OnEmailChange _ => _onEmailChange(event, emit),
      },
      transformer: log(),
    );
  }

  FutureOr<void> _onInitial(
    _OnInitial event,
    Emitter<SignupState> emit,
  ) async {
    // do on initial
  }

  FutureOr<void> _onClickSubmit(
    _OnClickSubmit event,
    Emitter<SignupState> emit,
  ) async {
    showLoading();

    await Future.delayed(
      const Duration(seconds: 1),
      () {
        hideLoading();
      },
    );
  }

  FutureOr<void> _onUsernameChange(
    _OnUsernameChange event,
    Emitter<SignupState> emit,
  ) async {
    // do on username change
  }

  FutureOr<void> _onPasswordChange(
    _OnPasswordChange event,
    Emitter<SignupState> emit,
  ) async {
    // do on password change
  }

  FutureOr<void> _onPhoneNumberChange(
    _OnPhoneNumberChange event,
    Emitter<SignupState> emit,
  ) async {
    // do on phone number change
  }

  FutureOr<void> _onEmailChange(
    _OnEmailChange event,
    Emitter<SignupState> emit,
  ) async {
    // do on email change
  }
}
