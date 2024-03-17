import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/app/settings/settings_vm.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:caffeio/design_system/atoms/fields/caffeio_field.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends ViewState<SupportPage, SettingsViewModel> {
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
        return Scaffold(
          appBar: AppBar(
            title: const Text('Support'),
          ),
          body: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              CaffeioField(
                label: 'Email',
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 16.0),
              CaffeioField(
                label: 'Message',
                minLines: 3,
                maxLines: 5,
                textInputAction: TextInputAction.send,
              ),
            ],
          ),
          bottomNavigationBar: SafeArea(
            child: Container(
              margin: EdgeInsets.only(
                bottom: MediaQuery.viewInsetsOf(context).bottom,
              ),
              padding: theme.insets.xs,
              child: CaffeioButton(
                text: 'Send',
                callback: () {},
              ),
            ),
          ),
        );
      },
    );
  }
}
