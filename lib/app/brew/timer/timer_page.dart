import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/brew/timer/timer_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:caffeio/design_system/atoms/loading/loading_indicator.dart';
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
          stream: viewModel.state,
          builder: (context, snapshot) {
            final state = snapshot.data;
            if (state != null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    state.seeTimer,
                    style: const TextStyle(
                      fontSize: 48,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CaffeioButton(
                        text: 'Star',
                        callback: viewModel.startTimer,
                      ),
                      CaffeioButton(
                        text: 'Restart',
                        callback: viewModel.resetTimer,
                      ),
                      CaffeioButton(
                        text: 'Pause',
                        callback: viewModel.pauseTimer,
                      ),
                    ],
                  )
                ],
              );
            }
            return const LoadingIndicator();
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CaffeioButton(text: 'Finished', callback: viewModel.nextPage),
      ),
    );
  }
}
