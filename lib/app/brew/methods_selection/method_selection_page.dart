import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/brew/methods_selection/method_selection_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
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

    return Scaffold(
      appBar: AppBar(title: const Text('Select Method')),
      body: StreamBuilder<MethodSelectionState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          final state = snapshot.data;
          if (state != null) {
            return Column(
              children: [
                Text(
                  state.brewingMethods[state.pageSelection].name,
                  style: theme.typo.title,
                ),
                SizedBox(height: theme.spacing.xs),
                SizedBox(
                  height: 250,
                  child: PageView(
                    onPageChanged: viewModel.onChangePageView,
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    children: state.brewingMethods
                        .map(
                          (e) => _Card(
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
                Padding(
                  padding: theme.insets.xs,
                  child: Text(
                    state.brewingMethods[state.pageSelection].description,
                    style: theme.typo.body,
                  ),
                ),
              ],
            );
          }
          return const LoadingIndicator();
        },
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.all(theme.spacing.xs),
        child: CaffeioButton(
          callback: viewModel.onNextPressed,
          text: "Next",
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}

class _Card extends StatelessWidget {
  final String name;
  final String description;
  final String image;

  const _Card({
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
        padding: context.theme.insets.xs,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        width: 300,
        height: 200,
        child: Image.asset(image),
      ),
    );
  }
}
