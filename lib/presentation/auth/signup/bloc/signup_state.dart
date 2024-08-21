import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_navigator/helper/base/bloc/bloc_base.dart';

part 'signup_state.freezed.dart';

@freezed
abstract class SignupState extends BaseBlocState with _$SignupState {
  factory SignupState({
    @Default(null) loginData,
    @Default('') String username,
    @Default('') String password,
    @Default('') String phoneNumber,
    @Default('') String email,
  }) = _SignupState;
}
