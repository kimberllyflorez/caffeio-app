import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/common/responsive.dart';
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
    super.key,
    required this.method,
  });

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
        title: Text(widget.method.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.method.name,
              child: Container(
                margin: theme.insets.xs,
                width: context.responsive.width,
                height: context.responsive.heightPercent(40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.method.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: theme.insets.xs,
          child: CaffeioButton(
            callback: () => viewModel.onBrewButtonPressed(widget.method),
            text: 'Brew',
          ),
        ),
      ),
    );
  }
}
