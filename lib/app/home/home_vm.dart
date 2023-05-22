import 'dart:async';

import 'package:caffeio/app/home/model/brew_by_date.dart';
import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:caffeio/domain/use_cases/auth/get_profile_uc.dart';
import 'package:caffeio/domain/use_cases/brew/fetch_user_brews_uc.dart';
import 'package:caffeio/domain/use_cases/brew/get_brews_by_date_uc.dart';
import 'package:caffeio/domain/use_cases/brew/get_user_brews_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/fetch_brewing_methods_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/get_brewing_methods_uc.dart';
import 'package:caffeio/entities/brew/brewing_method.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

class HomePageState extends Equatable {
  final List<BrewingMethod> brewingMethods;
  final List<BrewByDate> userBrews;
  final bool isUserLogged;
  final bool loading;

  const HomePageState({
    this.brewingMethods = const [],
    this.userBrews = const [],
    this.isUserLogged = false,
    this.loading = true,
  });

  HomePageState copyWith({
    List<BrewingMethod>? brewingMethods,
    List<BrewByDate>? userBrews,
    bool? isUserLogged,
    bool? loading,
  }) {
    return HomePageState(
      brewingMethods: brewingMethods ?? this.brewingMethods,
      userBrews: userBrews ?? this.userBrews,
      isUserLogged: isUserLogged ?? this.isUserLogged,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [
        brewingMethods,
        userBrews,
        isUserLogged,
        loading,
      ];
}

class HomeViewModel extends ViewModel {
  final FetchBrewingMethodsUseCase _fetchBrewingMethodsUseCase;
  final GetBrewingMethodsUseCase _getBrewingMethodsUseCase;
  final FetchUserBrewsUseCase _fetchUserBrewsUseCase;
  final GetUserBrewsUseCase _getUserBrewsUseCase;
  final GetProfileUseCase _getProfileUseCase;
  final GetBrewsByDateUseCase _getBrewsByDateUseCase;

  final _state = BehaviorSubject<HomePageState>.seeded(const HomePageState());

  Stream<HomePageState> get state => _state.stream;

  final _router = BehaviorSubject<RouteSpec>();

  Stream<RouteSpec> get router => _router;

  StreamSubscription<HomePageState>? _homeSubscription;

  HomeViewModel(
    this._fetchBrewingMethodsUseCase,
    this._getBrewingMethodsUseCase,
    this._fetchUserBrewsUseCase,
    this._getUserBrewsUseCase,
    this._getProfileUseCase,
    this._getBrewsByDateUseCase,
  );

  @override
  Future<void> init() async {
    await _fetchBrewingMethodsUseCase();
    await _fetchUserBrewsUseCase();
    _homeSubscription?.cancel();
    _homeSubscription = Rx.combineLatest3(
        _getBrewingMethodsUseCase(),
        _getUserBrewsUseCase(),
        _getProfileUseCase(), (methods, userBrews, profile) {
      final datedBrews = _getBrewsByDateUseCase(userBrews);
      return HomePageState(
        brewingMethods: methods,
        isUserLogged: profile != null,
        userBrews: datedBrews,
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

  void onMethodPressed(BrewingMethod method) {
    _router.add(
      RouteSpec.push(route: MethodRoute(method: method)),
    );
  }

  @override
  void dispose() {
    _state.close();
    _router.close();
    _homeSubscription?.cancel();
  }
}
