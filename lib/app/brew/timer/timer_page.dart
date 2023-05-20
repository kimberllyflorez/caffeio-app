import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/brew/timer/timer_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_circular_button.dart';
import 'package:caffeio/design_system/atoms/loading/loading_indicator.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TimerPageState();
}

class _TimerPageState extends ViewState<TimerPage, TimerViewModel>
    with SingleTickerProviderStateMixin {
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
      appBar: AppBar(
        backgroundColor: theme.palette.blueScale.primaryColor,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
      ),
      body: StreamBuilder<TimerState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          final state = snapshot.data;
          if (state != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _TimerSection(
                  timer: state.seeTimer,
                  milliseconds: state.milliseconds,
                  onPause: viewModel.pauseTimer,
                  onStart: viewModel.startTimer,
                  isRunning: state.isRunning,
                  isPaused: state.isPaused,
                ),
                _TimerActions(
                  onPause: viewModel.pauseTimer,
                  onRestart: viewModel.resetTimer,
                  onStart: viewModel.startTimer,
                  isRunning: state.isRunning,
                  isPaused: state.isPaused,
                ),
                SizedBox(height: theme.spacing.l),
              ],
            );
          }
          return const LoadingIndicator();
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CaffeioButton(text: 'Finish', callback: viewModel.nextPage),
      ),
    );
  }
}

class _TimerSection extends StatelessWidget {
  final String timer;
  final String milliseconds;
  final VoidCallback onStart;
  final VoidCallback onPause;
  final bool isRunning;
  final bool isPaused;

  const _TimerSection({
    Key? key,
    required this.timer,
    required this.milliseconds,
    required this.onStart,
    required this.onPause,
    required this.isRunning,
    required this.isPaused,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (isRunning) {
              onPause();
            } else {
              onStart();
            }
          },
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 100,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: const Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Text(
                  timer,
                  style: theme.typo.title.copyWith(
                    color: theme.palette.blueScale.primaryColor,
                    fontSize: 76,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                bottom: 70,
                right: 43,
                child: Text(
                  milliseconds,
                  style: theme.typo.title.copyWith(
                    color:
                        theme.palette.blueScale.primaryColor.withOpacity(.26),
                    fontSize: 36,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TimerActions extends StatelessWidget {
  final VoidCallback onStart;
  final VoidCallback onPause;
  final VoidCallback onRestart;
  final bool isRunning;
  final bool isPaused;

  const _TimerActions({
    Key? key,
    required this.onStart,
    required this.onPause,
    required this.onRestart,
    required this.isRunning,
    required this.isPaused,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: !isRunning || isPaused,
          child: CaffeioCircularButton(
            callback: onStart,
            child: const Icon(Icons.play_arrow_rounded),
          ),
        ),
        Visibility(
          visible: isRunning,
          child: CaffeioCircularButton(
            callback: onPause,
            child: const Icon(Icons.pause_rounded),
          ),
        ),
        Visibility(
          visible: isRunning || isPaused,
          child: CaffeioCircularButton(
            callback: onRestart,
            child: const Icon(Icons.restart_alt_rounded),
          ),
        ),
      ],
    );
  }
}
