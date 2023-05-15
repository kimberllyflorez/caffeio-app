import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/brew/method_selection_vm.dart';
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
  @override
  void initState() {
    super.initState();
    listenToNavigation(viewModel.router);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: StreamBuilder<MethodSelectionState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'select method',
                  style: context.theme.typo.title,
                ),
                Text(
                  "select that you what to brew your coffee today",
                  style: context.theme.typo.subtitle,
                ),
                _SelectorMethodCarousel(
                  controller: PageController(initialPage: data.pageSelection),
                  onChangePage: (index) => viewModel.changePageView(index),
                  list: _list,
                  descriptions: data.brewingMethods
                      .map(
                        (method) => Text(method.description),
                      )
                      .toList(),
                ),
              ],
            );
          }
          return const LoadingIndicator();
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CaffeioButton(
          text: 'Next',
          callback: viewModel.nextPage,
        ),
      ),
    );
  }

  final List<Widget> _list = <Widget>[
    Center(
      child: Container(
        height: 160,
        width: 260,
        color: Colors.grey,
        child: const Text("Page one"),
      ),
    ),
    Center(
      child: Container(
        height: 160,
        width: 260,
        color: Colors.purple,
        child: const Text("Page two"),
      ),
    ),
    Center(
      child: Container(
        height: 160,
        width: 260,
        color: Colors.blue,
        child: const Text("Page Three"),
      ),
    ),
  ];
}

class _SelectorMethodCarousel extends StatelessWidget {
  const _SelectorMethodCarousel({
    required this.controller,
    required this.onChangePage,
    required this.list,
    required this.descriptions,
    super.key,
  });

  final PageController controller;
  final List<Widget> list;
  final Function(int) onChangePage;
  final List<Widget> descriptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: PageView(
            onPageChanged: onChangePage,
            controller: controller,
            scrollDirection: Axis.horizontal,
            children: list,
          ),
        ),
        SmoothPageIndicator(
          controller: controller,
          count: list.length,
          effect: const ScrollingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              dotColor: Colors.grey,
              activeDotColor: Colors.purple),
        ),
        SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: descriptions),
        )
      ],
    );
  }
}
