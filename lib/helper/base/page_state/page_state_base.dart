import 'package:flutter/material.dart' as m;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:w_navigator/app/bloc/app_bloc.dart';
import 'package:w_navigator/helper/base/bloc/bloc_base.dart';
import 'package:w_navigator/helper/base/common_bloc/common_bloc.dart';
import 'package:w_navigator/helper/base/common_bloc/common_state.dart';
import 'package:w_navigator/helper/di/app_di.dart';
import 'package:w_navigator/helper/log/log.dart';
import 'package:w_navigator/helper/navigator/app_navigator/app_navigator.dart';

abstract class BasePageState<T extends m.StatefulWidget, B extends BaseBloc>
    extends BasePageStateDelegate<T, B> with LogMixin {}

abstract interface class BasePageStateDelegate<T extends m.StatefulWidget,
        B extends BaseBloc> extends m.State<T>
    with m.AutomaticKeepAliveClientMixin {
  late final AppBloc appBloc = getIt.get<AppBloc>();
  late final AppNavigator navigator = getIt.get<AppNavigator>();

  late final CommonBloc commonBloc = getIt.get<CommonBloc>()
        ..navigator = navigator
        // ..disposeBag = disposeBag
        ..appBloc = appBloc
      // ..exceptionHandler = exceptionHandler
      // ..exceptionMessageMapper = exceptionMessageMapper
      ;

  late final B bloc = getIt.get<B>()
        ..navigator = navigator
        // ..disposeBag = disposeBag
        ..appBloc = appBloc
        ..commonBloc = commonBloc
      // ..exceptionHandler = exceptionHandler
      // ..exceptionMessageMapper = exceptionMessageMapper
      ;

  bool get isMaterialPage => false;

  m.Widget buildPage(m.BuildContext context);

  @override
  bool get wantKeepAlive => false;

  @override
  m.Widget build(m.BuildContext context) {
    super.build(context);

    return Provider(
      create: (context) => navigator,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => commonBloc),
          BlocProvider(create: (_) => bloc),
        ],
        child: isMaterialPage
            ? buildPage(context)
            : m.Stack(
                children: [
                  buildPage(context),
                  BlocBuilder<CommonBloc, CommonState>(
                    builder: (context, state) {
                      return m.Visibility(
                        visible: state.isLoading,
                        child: buildPageLoading(),
                      );
                    },
                  )
                ],
              ),
      ),
    );
  }

  m.Widget buildPageLoading() => m.Container(
        color: m.Colors.blueGrey.withOpacity(.25),
        child: const m.Center(
          child: m.CircularProgressIndicator(
            strokeWidth: 2.5,
          ),
        ),
      );

  @override
  void dispose() {
    super.dispose();
  }
}
