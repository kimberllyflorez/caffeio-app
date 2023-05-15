import 'dart:async';

import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/fetch_brewing_methods_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/get_brewing_methods_uc.dart';
import 'package:caffeio/entities/brewing_methods/brewing_method.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

class HomePageState extends Equatable {
  final List<BrewingMethod> brewingMethods;
  final List<dynamic> history;

  const HomePageState({
    this.brewingMethods = const [],
    this.history = const [],
  });

  HomePageState copyWith({
    List<BrewingMethod>? brewingMethods,
    List<dynamic>? history,
  }) {
    return HomePageState(
      brewingMethods: brewingMethods ?? this.brewingMethods,
      history: history ?? this.history,
    );
  }

  @override
  List<Object?> get props => [
        brewingMethods,
        history,
      ];
}

class HomeViewModel extends ViewModel {
  final FetchBrewingMethodsUseCase _fetchBrewingMethodsUseCase;
  final GetBrewingMethodsUseCase _getBrewingMethodsUseCase;

  final _subscriptions = CompositeSubscription();

  final _state = BehaviorSubject<HomePageState>.seeded(const HomePageState());

  Stream<HomePageState> get state => _state.stream;

  final _router = BehaviorSubject<RouteSpec>();

  Stream<RouteSpec> get router => _router;

  HomeViewModel(
    this._fetchBrewingMethodsUseCase,
    this._getBrewingMethodsUseCase,
  );

  @override
  Future<void> init() async {
    await _fetchBrewingMethodsUseCase();
    _subscriptions.add(_getBrewingMethodsUseCase().listen((methods) {
      _state.add(_state.value.copyWith(brewingMethods: methods));
    }));
  }

  void onUserPressed() {
    _router.add(RouteSpec.push(route: const LoginRoute()));
  }

  @override
  void dispose() {
    _subscriptions.cancel();
    _state.close();
    _router.close();
  }
}
