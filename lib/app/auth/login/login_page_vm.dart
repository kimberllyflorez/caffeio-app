import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:caffeio/domain/models/auth/user_login.dart';
import 'package:caffeio/domain/use_cases/auth/sign_in_with_password_uc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

class LoginPageState extends Equatable {
  final String email;
  final String password;

  const LoginPageState({
    this.email = '',
    this.password = '',
  });

  LoginPageState copyWith({
    String? email,
    String? password,
  }) =>
      LoginPageState(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}

class LoginPageViewModel extends ViewModel {
  final SignInWithPasswordUseCase _signInUseCase;

  final _state = BehaviorSubject<LoginPageState>.seeded(const LoginPageState());

  Stream<LoginPageState> get state => _state.stream;

  final _router = BehaviorSubject<RouteSpec>();

  Stream<RouteSpec> get router => _router;

  LoginPageViewModel(this._signInUseCase);

  @override
  void init() {}

  Future<void> onLogin() async {
    final loginData = UserLogin(
      email: _state.value.email,
      password: _state.value.password,
    );
    final result = await _signInUseCase.call(loginData);
    if (result) {
      _router.add(RouteSpec.pop());
    }

    ///TODO: handle login errors
  }

  void onChangePassword(String value) {
    _state.add(_state.value.copyWith(password: value));
  }

  void onChangeEmail(String value) {
    _state.add(_state.value.copyWith(email: value));
  }

  @override
  void dispose() {}
}
