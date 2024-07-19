import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/features/support/support_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
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

class _SupportPageState extends ViewState<SupportPage, SupportViewModel> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return StreamBuilder<SupportPageState>(
      stream: viewModel.state,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Support'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              CaffeioField(
                initialValue: snapshot.data?.email,
                label: 'Email',
                textInputAction: TextInputAction.next,
                onChanged: viewModel.onEmailChanged,
              ),
              const SizedBox(height: 16.0),
              CaffeioField(
                label: 'Message',
                minLines: 3,
                maxLines: 5,
                textInputAction: TextInputAction.send,
                onChanged: viewModel.onMessageChanged,
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
                callback: viewModel.onSendMessagePressed,
              ),
            ),
          ),
        );
      },
    );
  }
}
