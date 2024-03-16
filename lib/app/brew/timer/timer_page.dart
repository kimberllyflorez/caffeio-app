import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/brew/ratio/ratio_model.dart';
import 'package:caffeio/app/brew/timer/timer_vm.dart';
import 'package:caffeio/app/brew/timer/widgets/timer_wd.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:caffeio/design_system/atoms/loading/loading_indicator.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TimerPage extends StatefulWidget {
  final RatioModelView ratioMode;

  const TimerPage({
    super.key,
    required this.ratioMode,
  });

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _BrewInfoCard(brew: widget.ratioMode),
                TimerSection(
                  timer: state.seeTimer,
                  milliseconds: state.milliseconds,
                  onPause: viewModel.pauseTimer,
                  onStart: viewModel.startTimer,
                  isRunning: state.isRunning,
                  isPaused: state.isPaused,
                  time: state.time,
                ),
                TimerActions(
                  onPause: viewModel.pauseTimer,
                  onRestart: viewModel.resetTimer,
                  onStart: viewModel.startTimer,
                  isRunning: state.isRunning,
                  isPaused: state.isPaused,
                ),
                const SizedBox.shrink(),
              ],
            );
          }
          return const LoadingIndicator();
        },
      ),
      bottomNavigationBar: Padding(
        padding: theme.insets.xs,
        child: CaffeioButton(
          text: 'Finish',
          callback: () => viewModel.nextPage(widget.ratioMode),
        ),
      ),
    );
  }
}

class _BrewInfoCard extends StatelessWidget {
  final RatioModelView brew;

  const _BrewInfoCard({
    required this.brew,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: theme.spacing.xxs,
          horizontal: theme.spacing.xs,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              _getImage(brew.method.id),
              width: 62,
              height: 62,
            ),
            SizedBox(width: theme.spacing.xs),
            SizedBox(
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    brew.method.name,
                    style: theme.typo.body.copyWith(),
                  ),
                  Text(
                    '1:${brew.ratio}',
                    style: theme.typo.body.copyWith(),
                  ),
                ],
              ),
            ),
            SizedBox(width: theme.spacing.xs),
            SizedBox(
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${brew.gramsCoffee.toInt()} gr",
                    style: theme.typo.title.copyWith(
                      color: theme.palette.brownScale.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  Text(
                    "${brew.water} ml",
                    style: theme.typo.title.copyWith(
                      color: Colors.cyan,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getImage(int id) {
    if (id == 5) return 'assets/images/v60.png';
    if (id == 6) return 'assets/images/french-press.png';
    if (id == 7) return 'assets/images/aeropress.png';
    return 'assets/images/chemex.png';
  }
}
