import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/method/method_page_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:caffeio/entities/brew/brewing_method.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MethodPage extends StatefulWidget {
  final BrewingMethod method;

  const MethodPage({
    Key? key,
    required this.method,
  }) : super(key: key);

  @override
  State<MethodPage> createState() => _MethodPageState();
}

class _MethodPageState extends ViewState<MethodPage, MethodPageViewModel> {
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
        title: const Text('Methods Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.method.name,
              child: Center(
                child: Container(
                  margin: theme.insets.xs,
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    widget.method.image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Padding(
              padding: theme.insets.xs,
              child: Text(
                widget.method.name,
                style: theme.typo.title,
              ),
            ),
            Padding(
              padding: theme.insets.xs.toHorizontal,
              child: Text(
                widget.method.history,
                style: theme.typo.body,
              ),
            ),
            SizedBox(height: theme.spacing.xs),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: theme.insets.xs,
        child: CaffeioButton(
          callback: () => viewModel.onBrewButtonPressed(widget.method.id),
          text: 'Brew',
        ),
      ),
    );
  }
}
