import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/brew/timer_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimerPageState();
}

class _TimerPageState extends ViewState<TimerPage, TimerViewModel> {
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
      body: StreamBuilder<TimerState>(
          stream: null,
          builder: (context, snapshot) {
            return Container();
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CaffeioButton(
              text: 'Star',
              callback: () {},
            ),
            CaffeioButton(
              text: 'Restart',
              callback: () {},
            ),
            CaffeioButton(text: 'Finished', callback: viewModel.nextPage),
          ],
        ),
      ),
    );
  }
}
