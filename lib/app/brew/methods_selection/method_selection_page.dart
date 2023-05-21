import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/brew/methods_selection/method_selection_vm.dart';
import 'package:caffeio/app/common/responsive.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/design_system/atoms/container/caffeio_bottom_container.dart';
import 'package:caffeio/design_system/atoms/loading/loading_indicator.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class MethodSelectionPage extends StatefulWidget {
  const MethodSelectionPage({Key? key}) : super(key: key);

  @override
  State<MethodSelectionPage> createState() => _MethodSelectionPageState();
}

class _MethodSelectionPageState
    extends ViewState<MethodSelectionPage, MethodSelectionViewModel> {
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
          appBar: AppBar(title: const Text('Select Method')),
          body: Visibility(
            visible: state.brewingMethods.isNotEmpty,
            replacement: const LoadingIndicator(),
            child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  padding: theme.insets.xs.toHorizontal,
                  child: Text(
                    'Which method do you want to use today?',
                    style: theme.typo.title,
                  ),
                ),
                SizedBox(
                  height: context.responsive.heightPercent(32),
                  child: PageView(
                    onPageChanged: viewModel.onChangePageView,
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    children: state.brewingMethods
                        .map(
                          (e) => _MethodCard(
                            name: e.name,
                            description: e.description,
                            image: e.image,
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(height: theme.spacing.xs),
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
          bottomNavigationBar: _BottomSection(
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
    Key? key,
    required this.name,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: context.theme.insets.xs,
      child: Container(
        width: 300,
        height: 200,
        padding: context.theme.insets.xs,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}

class _BottomSection extends StatelessWidget {
  final MethodSelectionState state;
  final VoidCallback onNextCallback;

  const _BottomSection({
    Key? key,
    required this.state,
    required this.onNextCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    if (state.brewingMethods.isEmpty) {
      return const SizedBox.shrink();
    }
    return CaffeioBottomContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: theme.spacing.m),
          Container(
            width: double.maxFinite,
            padding: theme.insets.xs.toHorizontal,
            child: Text(
              state.brewingMethods[state.pageSelection].name,
              style: theme.typo.title.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(height: context.theme.spacing.xxs),
          Padding(
            padding: theme.insets.xs.toHorizontal,
            child: Text(
              state.brewingMethods[state.pageSelection].description,
              style: theme.typo.body.copyWith(color: Colors.white),
            ),
          ),
          Padding(
            padding: theme.insets.xs.toVertical,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onNextCallback,
                  icon: const Icon(
                    Icons.navigate_next_rounded,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
