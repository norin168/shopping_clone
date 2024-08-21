import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_navigator/helper/base/bloc/bloc_base.dart';

part 'common_event.freezed.dart';

class CommonEvent extends BaseBlocEvent {}

@freezed
class OnChangeLoadingVisibility extends CommonEvent
    with _$OnChangeLoadingVisibility {
  const factory OnChangeLoadingVisibility({required bool loading}) =
      _OnChangeLoadingVisibility;
}

@freezed
class OnAddErrorEmitter extends CommonEvent with _$OnAddErrorEmitter {
  const factory OnAddErrorEmitter({required dynamic error}) =
      _OnAddErrorEmitter;
}
