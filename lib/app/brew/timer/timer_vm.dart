import 'dart:async';

import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/get_user_brew_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/set_user_brew_uc.dart';
import 'package:caffeio/domain/use_cases/timer/format_stopwatch_time_uc.dart';
import 'package:caffeio/entities/brew/brewing_method.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class TimerState extends Equatable {
  final Duration elapsedTime;
  final String seeTimer;
  final String milliseconds;
  final bool isRunning;
  final bool isPaused;
  final int time;

  const TimerState({
    this.elapsedTime = Duration.zero,
    this.seeTimer = '00:00',
    this.milliseconds = '00',
    this.isRunning = false,
    this.isPaused = false,
    this.time = 0,
  });

  TimerState copyWith({
    String? seeTimer,
    String? milliseconds,
    Duration? elapsedTime,
    bool? isRunning,
    bool? isPaused,
    int? time,
  }) {
    return TimerState(
      isPaused: isPaused ?? this.isPaused,
      isRunning: isRunning ?? this.isRunning,
      elapsedTime: elapsedTime ?? this.elapsedTime,
      seeTimer: seeTimer ?? this.seeTimer,
      milliseconds: milliseconds ?? this.milliseconds,
      time: time ?? this.time,
    );
  }

  @override
  List<Object?> get props => [
        seeTimer,
        milliseconds,
        elapsedTime,
        isRunning,
        isPaused,
        time,
      ];
}

class TimerViewModel extends ViewModel {
  final FormatStopwatchTimeUseCase _formatUseCase;
  final SetUserBrewUseCase _setUserBrewUseCase;
  final GetUserBrewUseCase _getUserBrewUseCase;

  final _router = BehaviorSubject<RouteSpec>();

  TimerViewModel(
    this._formatUseCase,
    this._setUserBrewUseCase,
    this._getUserBrewUseCase,
  );

  Stream<RouteSpec> get router => _router;
  final _state = BehaviorSubject<TimerState>.seeded(const TimerState());

  Stream<TimerState> get state => _state;

  Timer? _timer;

  @override
  void init() {}

  void startTimer() {
    if (_timer == null || !_timer!.isActive) {
      _timer = Timer.periodic(
        const Duration(milliseconds: 10),
        (_) {
          final timer =
              _state.value.elapsedTime + const Duration(milliseconds: 10);
          final String seeTimer = _formatUseCase(timer);
          String milliseconds = timer.inMilliseconds.toString();
          int secondLastDigit = getSecondLastDigit(milliseconds);
          int beforeSecondLastDigit = getBeforeSecondLastDigit(milliseconds);
          _state.add(_state.value.copyWith(
            elapsedTime: timer,
            seeTimer: seeTimer,
            milliseconds: '$beforeSecondLastDigit$secondLastDigit',
            isRunning: true,
            isPaused: false,
            time: timer.inMilliseconds,
          ));
        },
      );
    }
  }

  int getSecondLastDigit(String number) {
    int length = number.length;

    if (length >= 2) {
      return int.parse(number[length - 2]);
    } else {
      return 0;
    }
  }

  int getBeforeSecondLastDigit(String number) {
    int length = number.length;

    if (length >= 3) {
      return int.parse(number[length - 3]);
    } else {
      return 0;
    }
  }

  void pauseTimer() {
    _timer?.cancel();
    _state.add(_state.value.copyWith(isRunning: false, isPaused: true));
  }

  void resetTimer() {
    _state.add(const TimerState());
    _timer?.cancel();
    _timer = null;
  }

  void nextPage(BrewingMethod method) {
    if (_getUserBrewUseCase() == null) {
      _setUserBrewUseCase();
    }
    _router.add(RouteSpec.replaceAllWithOne(route: const HomeRoute()));
  }

  @override
  void dispose() {
    _state.close();
    _timer?.cancel();
  }
}
