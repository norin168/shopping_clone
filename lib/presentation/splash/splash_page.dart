import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:w_navigator/helper/base/page_state/page_state_base.dart';
import 'package:w_navigator/helper/extensions/context_extenions.dart';
import 'package:w_navigator/presentation/splash/bloc/splash_bloc.dart';

@RoutePage()
class SplashPageNew extends StatefulWidget {
  const SplashPageNew({super.key});

  @override
  State<SplashPageNew> createState() => _SplashPageNewState();
}

class _SplashPageNewState extends BasePageState<SplashPageNew, SplashBloc> {
  @override
  void initState() {
    // in case have data included
    bloc.add(const SplashEvent.load());
    super.initState();
  }

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator(
              strokeWidth: 2.5,
            ),
            16.h,
            Text(
              'Sync...',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
