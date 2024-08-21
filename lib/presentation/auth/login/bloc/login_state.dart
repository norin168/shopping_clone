import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_navigator/helper/base/bloc/bloc_base.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState extends BaseBlocState with _$LoginState {
  factory LoginState({
    dynamic loginData,
    @Default('') String username,
    @Default('') String password,
  }) = _LoginState;
}
