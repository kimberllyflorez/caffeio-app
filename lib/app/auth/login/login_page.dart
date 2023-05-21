import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/auth/login/login_page_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:caffeio/design_system/atoms/loading/loading_indicator.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ViewState<LoginPage, LoginPageViewModel> {
  @override
  void initState() {
    super.initState();
    listenToNavigation(viewModel.router);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: StreamBuilder<LoginPageState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          final state = snapshot.data;
          if (state == null) {
            return const LoadingIndicator();
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: theme.spacing.s),
                Padding(
                  padding: theme.insets.s.toHorizontal,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    onChanged: viewModel.onChangeEmail,
                  ),
                ),
                SizedBox(height: theme.spacing.s),
                Padding(
                  padding: theme.insets.s.toHorizontal,
                  child: TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    onChanged: viewModel.onChangePassword,
                  ),
                ),
                SizedBox(height: theme.spacing.s),
                Visibility(
                  visible: state.error != null,
                  child: Text(
                    '${state.error}',
                    style: theme.typo.body.copyWith(color: Colors.deepOrange),
                  ),
                ),
                SizedBox(height: theme.spacing.s),
                CaffeioButton(
                  callback: viewModel.onLogin,
                  text: 'Log in',
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
