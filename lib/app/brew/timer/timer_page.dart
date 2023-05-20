import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/brew/ratio/ratio_model.dart';
import 'package:caffeio/app/brew/timer/timer_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_circular_button.dart';
import 'package:caffeio/design_system/atoms/loading/loading_indicator.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

@RoutePage()
class TimerPage extends StatefulWidget {
  final RatioModelView ratioMode;

  const TimerPage({
    Key? key,
    required this.ratioMode,
  }) : super(key: key);

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
                _preparationData(
                    ratio: widget.ratioMode.ratio.toString(),
                    water: widget.ratioMode.water.toString(),
                    gramsCoffee: widget.ratioMode.gramsCoffee.toString(),
                    preparationSelected: widget.ratioMode.method.name),
                _TimerSection(
                  timer: state.seeTimer,
                  milliseconds: state.milliseconds,
                  onPause: viewModel.pauseTimer,
                  onStart: viewModel.startTimer,
                  isRunning: state.isRunning,
                  isPaused: state.isPaused,
                  time: state.time,
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
        child: CaffeioButton(
          text: 'Finish',
          callback: () => viewModel.nextPage(widget.ratioMode),
        ),
      ),
    );
  }
}

class _preparationData extends StatelessWidget {
  final String ratio;
  final String water;
  final String gramsCoffee;
  final String preparationSelected;

  const _preparationData(
      {Key? key,
      required this.ratio,
      required this.water,
      required this.gramsCoffee,
      required this.preparationSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$preparationSelected   $water ml"),
        Text("$gramsCoffee ,  $ratio"),
      ],
    );
  }
}

class _TimerSection extends StatelessWidget {
  final int time;
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
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colors = isRunning || isPaused
        ? [
            const Color(0x90603020),
            const Color(0xFF5C4740),
            const Color(0x70603020)
          ]
        : [
            const Color(0x00603020),
            const Color(0x005C4740),
            const Color(0x00603020)
          ];

    const durations = [15000, 10000, 5000];

    const heightPercentages = <double>[0.65, 0.66, 0.67];
    final heightValue = time.toDouble() / 20;
    return GestureDetector(
      onTap: isRunning ? onPause : onStart,
      child: Container(
        width: 300,
        height: 320,
        clipBehavior: Clip.antiAlias,
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: WaveWidget(
                config: CustomConfig(
                  colors: colors,
                  durations: durations,
                  heightPercentages: heightPercentages,
                ),
                backgroundColor: Colors.transparent,
                size: Size(300, heightValue >= 320.0 ? 320.0 : heightValue),
                waveAmplitude: 0,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  timer,
                  style: theme.typo.title.copyWith(
                    color: theme.palette.blueScale.primaryColor,
                    fontSize: 76,
                    height: 0,
                  ),
                ),
                Text(
                  milliseconds,
                  style: theme.typo.title.copyWith(
                    color:
                        theme.palette.blueScale.primaryColor.withOpacity(.26),
                    fontSize: 36,
                    height: 0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
