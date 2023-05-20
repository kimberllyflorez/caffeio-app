import 'package:auto_route/annotations.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/app/onboarding/onboarding_page_vm.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState
    extends ViewState<OnboardingPage, OnboardingPageViewModel> {
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
        padding: theme.insets.xs,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/caffeio-icon-name-white.png',
              width: 180,
              height: 180,
            ),
            SizedBox(height: theme.spacing.s),
            Text(
              'Introducing Caffeio, the ultimate app for coffee aficionados. Explore a variety of coffee brewing methods like V60, AeroPress, and Chemex, with comprehensive guides and assistance to elevate your coffee experience. Uncover the captivating stories behind each method, deepening your appreciation for your favorites.',
              style: theme.typo.body.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: theme.insets.xs,
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
