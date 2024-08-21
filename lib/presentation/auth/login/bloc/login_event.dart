part of 'login_bloc.dart';

sealed class LoginEvent extends BaseBlocEvent {
  const LoginEvent._();

  const factory LoginEvent.onInitial() = _OnInitial;
  const factory LoginEvent.onClickSubmit() = _OnClickSubmit;
  const factory LoginEvent.onUsernameChange(String username) = _OnUsernameChnge;
  const factory LoginEvent.onPasswordChange(String password) =
      _OnPasswordChange;
}

class _OnInitial extends LoginEvent {
  const _OnInitial() : super._();
}

class _OnClickSubmit extends LoginEvent {
  const _OnClickSubmit() : super._();
}

class _OnUsernameChnge extends LoginEvent {
  final String username;
  const _OnUsernameChnge(this.username) : super._();
}

class _OnPasswordChange extends LoginEvent {
  final String password;
  const _OnPasswordChange(this.password) : super._();
}
