import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/app/settings/settings_vm.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ViewState<SettingsPage, SettingsViewModel> {
  @override
  void initState() {
    super.initState();
    listenToNavigation(viewModel.router);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return StreamBuilder<SettingsPageState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          final state = snapshot.data ?? const SettingsPageState();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Settings Page'),
              actions: [
                Visibility(
                  visible: state.userProfile != null,
                  child: IconButton(
                    onPressed: viewModel.onLogOut,
                    icon: const Icon(Icons.exit_to_app),
                  ),
                )
              ],
            ),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: state.userProfile == null,
                    replacement: ListTile(
                      leading: const CircleAvatar(),
                      title: Text(
                        state.userProfile?.email ?? '',
                      ),
                    ),
                    child: CaffeioButton(
                      callback: viewModel.onLoginPressed,
                      text: 'Login',
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'v0.0.1',
                    style: theme.typo.subtitle,
                  ),
                  Text(
                    'Bimbly Studios',
                    style: theme.typo.subtitle,
                  ),
                  const SizedBox(height: kToolbarHeight),
                ],
              ),
            ),
          );
        });
  }
}
