import 'dart:async';

import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/get_user_brew_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/set_user_brew_uc.dart';
import 'package:caffeio/domain/use_cases/timer/format_stopwatch_time_uc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class TimerState extends Equatable {
  final Duration elapsedTime;
  final String seeTimer;

  const TimerState({
    this.elapsedTime = Duration.zero,
    this.seeTimer = '00:00',
  });

  TimerState copyWith({
    String? seeTimer,
    Duration? elapsedTime,
  }) {
    return TimerState(
      elapsedTime: elapsedTime ?? this.elapsedTime,
      seeTimer: seeTimer ?? this.seeTimer,
    );
  }

  @override
  List<Object?> get props => [
        seeTimer,
        elapsedTime,
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
    if(_timer == null || !_timer!.isActive) {
      _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        final timer = _state.value.elapsedTime + const Duration(seconds: 1);
        final String seeTimer = _formatUseCase(timer);
        _state.add(
          _state.value.copyWith(
            elapsedTime: timer,
            seeTimer: seeTimer,
          ),
        );
      },
    );
    }
  }

  void pauseTimer() {
    _timer?.cancel();
  }

  void resetTimer() {
    _state.add(const TimerState());
    _timer?.cancel();
    _timer = null;
  }

  void nextPage() {
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
