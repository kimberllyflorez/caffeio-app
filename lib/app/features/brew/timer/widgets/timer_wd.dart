import 'package:caffeio/design_system/atoms/buttons/caffeio_circular_button.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class TimerSection extends StatelessWidget {
  final int time;
  final String timer;
  final String milliseconds;
  final VoidCallback onStart;
  final VoidCallback onPause;
  final bool isRunning;
  final bool isPaused;

  const TimerSection({
    super.key,
    required this.timer,
    required this.milliseconds,
    required this.onStart,
    required this.onPause,
    required this.isRunning,
    required this.isPaused,
    required this.time,
  });

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

class TimerActions extends StatelessWidget {
  final VoidCallback onStart;
  final VoidCallback onPause;
  final VoidCallback onRestart;
  final bool isRunning;
  final bool isPaused;

  const TimerActions({
    super.key,
    required this.onStart,
    required this.onPause,
    required this.onRestart,
    required this.isRunning,
    required this.isPaused,
  });

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
