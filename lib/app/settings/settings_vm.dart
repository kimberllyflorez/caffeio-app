import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:caffeio/domain/use_cases/auth/get_profile_uc.dart';
import 'package:caffeio/domain/use_cases/auth/log_out_uc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsPageState extends Equatable {
  final User? userProfile;

  const SettingsPageState({
    this.userProfile,
  });

  @override
  List<Object?> get props => [
        userProfile,
      ];
}

class SettingsViewModel extends ViewModel {
  final GetProfileUseCase _getProfileUseCase;
  final LogOutUseCase _logOutUseCase;

  final _router = BehaviorSubject<RouteSpec>();

  Stream<RouteSpec> get router => _router;

  final _state = BehaviorSubject<SettingsPageState>.seeded(
    const SettingsPageState(),
  );

  Stream<SettingsPageState> get state => _state.stream;

  SettingsViewModel(
    this._getProfileUseCase,
    this._logOutUseCase,
  );

  @override
  void init() {
    _getProfileUseCase().listen((user) {
      _state.add(SettingsPageState(userProfile: user));
    });
  }

  void onLoginPressed() {
    _router.add(RouteSpec.push(route: const LoginRoute()));
  }

  void onLogOut() {
    _logOutUseCase();
    _router.add(RouteSpec.replaceAllWithOne(route: const HomeRoute()));
  }

  @override
  void dispose() {}
}
