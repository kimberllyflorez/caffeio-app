import 'package:auto_route/annotations.dart';
import 'package:caffeio/app/features/onboarding/onboarding_page_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/app/res/assets.dart';
import 'package:caffeio/app/res/strings.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:caffeio/design_system/theme/insets.dart';
import 'package:caffeio/design_system/theme/spacing.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ViewState<OnboardingPage, OnboardingPageViewModel> {
  @override
  void initState() {
    super.initState();
    listenToNavigation(viewModel.router);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      backgroundColor: theme.palette.blueScale.primaryColor,
      body: Padding(
        padding: CaffeioInsets.xs,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              CaffeioAssets.brandIconWhite,
              width: 180,
              height: 180,
            ),
            const SizedBox(height: CaffeioSpacing.s),
            Text(
              CaffeioStrings.caffeioDescription,
              style: theme.typo.body.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: CaffeioInsets.xs,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: viewModel.onNextPressed,
              icon: const Icon(
                Icons.navigate_next_rounded,
                color: Colors.white,
                size: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
