part of 'logout_bloc.dart';

sealed class LogoutEvent extends BaseBlocEvent {
  const LogoutEvent._();

  const factory LogoutEvent.onInitial() = _OnInitial;
}

class _OnInitial extends LogoutEvent {
  const _OnInitial() : super._();
}
