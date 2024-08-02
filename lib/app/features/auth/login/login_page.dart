import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/features/auth/login/login_page_vm.dart';
import 'package:caffeio/app/features/settings/widgets/version_card_wd.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/app/res/assets.dart';
import 'package:caffeio/app/res/strings.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_circular_button.dart';
import 'package:caffeio/design_system/atoms/loading/loading_indicator.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:caffeio/design_system/theme/insets.dart';
import 'package:caffeio/design_system/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: CaffeioSpacing.s),
                Image.asset(
                  CaffeioAssets.brandIconName,
                  width: 180,
                  height: 180,
                ),
                const SizedBox(height: CaffeioSpacing.s),
                Padding(
                  padding: CaffeioInsets.s.toHorizontal,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: CaffeioStrings.email,
                    ),
                    onChanged: viewModel.onChangeEmail,
                  ),
                ),
                const SizedBox(height: CaffeioSpacing.s),
                Padding(
                  padding: CaffeioInsets.s.toHorizontal,
                  child: TextField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: CaffeioStrings.password,
                    ),
                    onChanged: viewModel.onChangePassword,
                  ),
                ),
                const SizedBox(height: CaffeioSpacing.s),
                Visibility(
                  visible: state.error != null,
                  child: Text(
                    '${state.error}',
                    style: theme.typo.body.copyWith(color: Colors.deepOrange),
                  ),
                ),
                const SizedBox(height: CaffeioSpacing.s),
                CaffeioButton(
                  callback: viewModel.onLogin,
                  text: CaffeioStrings.login,
                ),
                const SizedBox(height: CaffeioSpacing.s),
                Padding(
                  padding: CaffeioInsets.xxl.toHorizontal,
                  child: Divider(
                    color: theme.palette.blueScale.primaryColor,
                  ),
                ),
                const SizedBox(height: CaffeioSpacing.s),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CaffeioCircularButton(
                      callback: viewModel.signInWithGoogle,
                      child: Icon(PhosphorIcons.googleLogo()),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const SafeArea(
        child: CaffeioBrandCard(),
      ),
    );
  }
}
