part of 'home_bloc.dart';

sealed class HomeEvent extends BaseBlocEvent {
  const HomeEvent._();

  const factory HomeEvent.onInitial() = _OnInitial;
}

class _OnInitial extends HomeEvent {
  const _OnInitial() : super._();
}
