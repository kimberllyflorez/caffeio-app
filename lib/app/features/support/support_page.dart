import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/features/support/support_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/app/res/strings.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:caffeio/design_system/atoms/fields/caffeio_field.dart';
import 'package:caffeio/design_system/theme/insets.dart';
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
    return StreamBuilder<SupportPageState>(
      stream: viewModel.state,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(CaffeioStrings.supportButtonLabel),
          ),
          body: ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              CaffeioField(
                initialValue: snapshot.data?.email,
                label: CaffeioStrings.email,
                textInputAction: TextInputAction.next,
                onChanged: viewModel.onEmailChanged,
              ),
              const SizedBox(height: 16.0),
              CaffeioField(
                label: CaffeioStrings.message,
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
              padding: CaffeioInsets.xs,
              child: CaffeioButton(
                text: CaffeioStrings.send,
                callback: viewModel.onSendMessagePressed,
              ),
            ),
          ),
        );
      },
    );
  }
}
