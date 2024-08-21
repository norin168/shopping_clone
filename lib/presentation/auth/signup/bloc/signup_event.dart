part of 'signup_bloc.dart';

sealed class SignupEvent extends BaseBlocEvent {
  const SignupEvent._();

  const factory SignupEvent.onInitial() = _OnInitial;
  const factory SignupEvent.onClickSubmit({
    required String username,
    required String password,
    required String phoneNumber,
  }) = _OnClickSubmit;
  const factory SignupEvent.onUsernameChange(String username) =
      _OnUsernameChange;
  const factory SignupEvent.onPasswordChange(String password) =
      _OnPasswordChange;
  const factory SignupEvent.onEmailChange(String email) = _OnEmailChange;
}

class _OnInitial extends SignupEvent {
  const _OnInitial() : super._();
}

class _OnClickSubmit extends SignupEvent {
  final String username;
  final String password;
  final String phoneNumber;
  const _OnClickSubmit({
    required this.password,
    required this.username,
    required this.phoneNumber,
  }) : super._();
}

class _OnUsernameChange extends SignupEvent {
  final String username;
  const _OnUsernameChange(this.username) : super._();
}

class _OnPasswordChange extends SignupEvent {
  final String password;
  const _OnPasswordChange(this.password) : super._();
}

class _OnPhoneNumberChange extends SignupEvent {
  final String phoneNumber;
  const _OnPhoneNumberChange(this.phoneNumber) : super._();
}

class _OnEmailChange extends SignupEvent {
  final String email;
  const _OnEmailChange(this.email) : super._();
}
