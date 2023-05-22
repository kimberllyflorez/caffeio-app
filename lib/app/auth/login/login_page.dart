import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/auth/login/login_page_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/app/settings/widgets/version_card_wd.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_circular_button.dart';
import 'package:caffeio/design_system/atoms/loading/loading_indicator.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
      appBar: AppBar(),
      body: StreamBuilder<LoginPageState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          final state = snapshot.data;
          if (state == null) {
            return const LoadingIndicator();
          }
          return Column(
            children: [
              SizedBox(height: theme.spacing.s),
              Image.asset(
                'assets/images/caffeio-icon-name.png',
                width: 180,
                height: 180,
              ),
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
              ),
              SizedBox(height: theme.spacing.s),
              Padding(
                padding: theme.insets.xxl.toHorizontal,
                child: Divider(
                  color: theme.palette.blueScale.primaryColor,
                ),
              ),
              SizedBox(height: theme.spacing.s),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CaffeioCircularButton(
                    callback: viewModel.signInWithGoogle,
                    child: Icon(PhosphorIcons.googleLogo()),
                  ),
                ],
              ),
              const Spacer(),
              const VersionCard(),
              SizedBox(height: theme.spacing.xxs),
            ],
          );
        },
      ),
    );
  }
}
