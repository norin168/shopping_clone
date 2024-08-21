part of 'splash_bloc.dart';

sealed class SplashEvent extends BaseBlocEvent {
  const SplashEvent._();

  const factory SplashEvent.load() = _OnInitial;
}

class _OnInitial extends SplashEvent {
  const _OnInitial() : super._();
}
