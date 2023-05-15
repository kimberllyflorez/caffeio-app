import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/brew/recommendations_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RecommendationsPage extends StatefulWidget {
  const RecommendationsPage({Key? key}) : super(key: key);

  @override
  State<RecommendationsPage> createState() => _RecommendationsPageState();
}

class _RecommendationsPageState extends ViewState<RecommendationsPage, RecommendationViewModel> {


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
      body:  Center(
        child: Column(
          children: [
            const Text('Recommended brewing '),
            const Text('4:5'),
             Container(
               margin: EdgeInsets.all(8.0),
              height: 150,
              width: double.infinity,
               decoration: const BoxDecoration(
                 color: Colors.cyan
               ),
            ),
            const Text('4:5'),
            Container(
              margin: const EdgeInsets.all(8.0),
              height: 160,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.cyan
              ),
            ),
            const Text('Others'),
            Container(
              margin: const EdgeInsets.all(8.0),
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.cyan
              ),
            ),
          ],
        ),
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
}
