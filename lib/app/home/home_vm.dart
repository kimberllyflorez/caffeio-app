import 'dart:async';

import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:caffeio/domain/use_cases/auth/is_session_valid_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/fetch_brewing_methods_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/get_brewing_methods_uc.dart';
import 'package:caffeio/entities/brewing_methods/brewing_method.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

class HomePageState extends Equatable {
  final List<BrewingMethod> brewingMethods;
  final List<dynamic> history;
  final bool isUserLogged;
  final bool loading;

  const HomePageState({
    this.brewingMethods = const [],
    this.history = const [],
    this.isUserLogged = false,
    this.loading = true,
  });

  HomePageState copyWith({
    List<BrewingMethod>? brewingMethods,
    List<dynamic>? history,
    bool? isUserLogged,
    bool? loading,
  }) {
    return HomePageState(
      brewingMethods: brewingMethods ?? this.brewingMethods,
      history: history ?? this.history,
      isUserLogged: isUserLogged ?? this.isUserLogged,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [
        brewingMethods,
        history,
        isUserLogged,
        loading,
      ];
}

class HomeViewModel extends ViewModel {
  final FetchBrewingMethodsUseCase _fetchBrewingMethodsUseCase;
  final GetBrewingMethodsUseCase _getBrewingMethodsUseCase;
  final IsSessionValidUseCase _isSessionValidUseCase;

  final _state = BehaviorSubject<HomePageState>.seeded(const HomePageState());

  Stream<HomePageState> get state => _state.stream;

  final _router = BehaviorSubject<RouteSpec>();

  Stream<RouteSpec> get router => _router;

  StreamSubscription<HomePageState>? _homeSubscription;

  HomeViewModel(
    this._fetchBrewingMethodsUseCase,
    this._getBrewingMethodsUseCase,
    this._isSessionValidUseCase,
  );

  @override
  Future<void> init() async {
    await _fetchBrewingMethodsUseCase();
    _homeSubscription?.cancel();
    _homeSubscription = Rx.combineLatest2(
        _getBrewingMethodsUseCase(), _isSessionValidUseCase().asStream(),
        (methods, isUserLogged) {
      return HomePageState(
        brewingMethods: methods,
        isUserLogged: isUserLogged,
        loading: false,
      );
    }).listen((event) {
      _state.add(event);
    });
  }

  void onUserPressed() {
    _router.add(RouteSpec.push(route: const SettingsRoute()));
  }

  void onLoginPressed() {
    _router.add(RouteSpec.push(route: const LoginRoute()));
  }

  void onBrewPressed() {
    _router.add(RouteSpec.push(route: const MethodSelectionRoute()));
  }

  @override
  void dispose() {
    _state.close();
    _router.close();
    _homeSubscription?.cancel();
  }
}
