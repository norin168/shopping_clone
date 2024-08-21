import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:w_navigator/helper/base/common_bloc/common_bloc.dart';
import 'package:w_navigator/helper/base/page_state/page_state_base.dart';
import 'package:w_navigator/helper/validator/auth_validator.dart';

@RoutePage()
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends BasePageState<SignupScreen, CommonBloc>
    implements ProductCardDelegate {
  @override
  void initState() {
    sharedProductCardHelper.delegate = this;
    super.initState();
  }

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Page'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('Signup Page'),
          onPressed: () {
            sharedProductCardHelper.onCardChanged('Sign up page');
          },
        ),
      ),
    );
  }

  @override
  void onCardChanged(String cardId) {
    print('Sign up page $cardId');
  }
}
