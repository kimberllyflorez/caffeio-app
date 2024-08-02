import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/common/responsive.dart';
import 'package:caffeio/app/features/brew/methods_selection/method_selection_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/app/res/strings.dart';
import 'package:caffeio/design_system/atoms/container/caffeio_bottom_container.dart';
import 'package:caffeio/design_system/atoms/loading/loading_indicator.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:caffeio/design_system/theme/insets.dart';
import 'package:caffeio/design_system/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class MethodSelectionPage extends StatefulWidget {
  const MethodSelectionPage({super.key});

  @override
  State<MethodSelectionPage> createState() => _MethodSelectionPageState();
}

class _MethodSelectionPageState extends ViewState<MethodSelectionPage, MethodSelectionViewModel> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    listenToNavigation(viewModel.router);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return StreamBuilder<MethodSelectionState>(
      stream: viewModel.state,
      builder: (context, snapshot) {
        final state = snapshot.data ?? const MethodSelectionState();
        return Scaffold(
          appBar: AppBar(
            title: const Text(CaffeioStrings.brewSelectMethod),
          ),
          body: Visibility(
            visible: state.brewingMethods.isNotEmpty,
            replacement: const LoadingIndicator(),
            child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  padding: CaffeioInsets.xs.toHorizontal,
                  child: Text(
                    CaffeioStrings.brewSelectionQuestion,
                    style: theme.typo.title,
                  ),
                ),
                SizedBox(
                  height: context.responsive.heightPercent(40),
                  child: PageView(
                    onPageChanged: viewModel.onChangePageView,
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    children: state.brewingMethods.map((method) {
                      return _MethodCard(
                        name: method.name,
                        description: method.description,
                        image: method.image,
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: CaffeioSpacing.xs),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: state.brewingMethods.length,
                  effect: ScaleEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: Colors.grey,
                    activeDotColor: theme.palette.blueScale.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: _BottomSection(
            state: state,
            onNextCallback: viewModel.onNextPressed,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}

class _MethodCard extends StatelessWidget {
  final String name;
  final String description;
  final String image;

  const _MethodCard({
    required this.name,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: CaffeioInsets.xs,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomSection extends StatelessWidget {
  final MethodSelectionState state;
  final VoidCallback onNextCallback;

  const _BottomSection({
    required this.state,
    required this.onNextCallback,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    if (state.brewingMethods.isEmpty) {
      return const SizedBox.shrink();
    }
    return CaffeioBottomContainer(
      height: context.responsive.heightPercent(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: CaffeioSpacing.m),
          Container(
            width: double.maxFinite,
            padding: CaffeioInsets.xs.toHorizontal,
            child: Text(
              state.brewingMethods[state.pageSelection].name,
              style: theme.typo.title.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: CaffeioSpacing.xxs),
          Padding(
            padding: CaffeioInsets.xs.toHorizontal,
            child: Text(
              state.brewingMethods[state.pageSelection].description,
              style: theme.typo.body.copyWith(color: Colors.white),
            ),
          ),
          const Spacer(),
          Padding(
            padding: CaffeioInsets.xs.toRight,
            child: SafeArea(
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: onNextCallback,
                  icon: const Icon(
                    Icons.navigate_next_rounded,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
