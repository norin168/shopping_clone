import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_navigator/helper/base/bloc/bloc_base.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState extends BaseBlocState with _$HomeState {
  const factory HomeState({@Default('') String appName}) = _HomeState;
}
