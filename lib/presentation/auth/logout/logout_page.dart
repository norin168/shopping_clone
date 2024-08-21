import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:w_navigator/helper/base/common_bloc/common_bloc.dart';
import 'package:w_navigator/helper/base/page_state/page_state_base.dart';

@RoutePage()
class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends BasePageState<LogoutScreen, CommonBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return const Scaffold();
  }
}
