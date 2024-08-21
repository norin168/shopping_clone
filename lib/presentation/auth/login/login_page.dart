import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_navigator/helper/base/page_state/page_state_base.dart';
import 'package:w_navigator/helper/extensions/context_extenions.dart';
import 'package:w_navigator/helper/navigator/info/app_route_info.dart';
import 'package:w_navigator/helper/validator/auth_validator.dart';
import 'package:w_navigator/presentation/auth/login/bloc/login_bloc.dart';
import 'package:w_navigator/presentation/auth/login/bloc/login_state.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BasePageState<LoginScreen, LoginBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                navigator.push(const AppRouteInfo.singUp());
                // bloc.add(const LoginEvent.onClickSubmit());
              },
              child: const Text('Click Me'),
            ),
            16.h,
            // Text(getIt.get<EnvConfig>().envName),
            BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (previous, current) =>
                  previous.username != current.username,
              builder: (context, state) {
                return Text(state.username);
              },
            ),
            16.h,
            TextButton(
              onPressed: () {
                ProductCardHelper().onCardChanged('myNewCard');

                // navigator.push(const AppRouteInfo.singUp());
                // bloc.add(const LoginEvent.onClickSubmit());
              },
              child: const Text('On Change'),
            ),
          ],
        ),
      ),
    );
  }
}
