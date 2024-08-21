import 'package:flutter/material.dart';
import 'package:w_navigator/app/bloc/app_bloc.dart';
import 'package:w_navigator/helper/base/page_state/page_state_base.dart';
import 'package:w_navigator/helper/di/app_di.dart';
import 'package:w_navigator/helper/navigator/app_router.dart' show AppRouter;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends BasePageState<MyApp, AppBloc> {
  final _appRouter = getIt.get<AppRouter>();

  @override
  bool get isMaterialPage => true;

  @override
  Widget buildPage(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      routerDelegate: _appRouter.delegate(
        navigatorObservers: () => [NavigatorObserver()],
      ),
      // routerConfig: _appRouter.config(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
