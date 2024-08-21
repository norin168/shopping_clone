import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:w_navigator/helper/base/bloc/bloc_base.dart';
import 'package:w_navigator/helper/base/common_bloc/common_event.dart';
import 'package:w_navigator/helper/base/common_bloc/common_state.dart';

@Injectable()
class CommonBloc extends BaseBloc<CommonEvent, CommonState> {
  CommonBloc() : super(const CommonState()) {
    on<OnChangeLoadingVisibility>(_onChangeLoadingVisibility);
    on<OnAddErrorEmitter>(_onAddErrorEmitter);
  }

  FutureOr<void> _onChangeLoadingVisibility(
    OnChangeLoadingVisibility event,
    Emitter<CommonState> emit,
  ) async {
    emit(state.copyWith(isLoading: event.loading));
  }

  Future<void> _onAddErrorEmitter(
    OnAddErrorEmitter event,
    Emitter<CommonState> emit,
  ) async {
    emit(state.copyWith(error: event.error));
  }
}
