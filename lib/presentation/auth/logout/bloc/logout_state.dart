import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_navigator/helper/base/bloc/bloc_base.dart';

part 'logout_state.freezed.dart';

@freezed
abstract class LogoutState extends BaseBlocState with _$LogoutState {
  factory LogoutState({
    @Default(null) logoutData,
    @Default('') name,
  }) = _LogoutState;
}
