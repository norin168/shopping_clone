import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_navigator/helper/base/bloc/bloc_base.dart';

part 'common_state.freezed.dart';

@freezed
class CommonState extends BaseBlocState with _$CommonState {
  const factory CommonState({
    @Default(false) bool isLoading,
    @Default(null) dynamic error,
  }) = _CommonState;
}
