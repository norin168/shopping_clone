import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_navigator/helper/base/bloc/bloc_base.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState extends BaseBlocState with _$SplashState {
  const factory SplashState({
    @Default(false) isUserLogin,
  }) = _SplashState;
}
