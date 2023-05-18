import 'package:equatable/equatable.dart';

class UserLogin extends Equatable {
  final String email;
  final String password;

  const UserLogin({
    this.email = '',
    this.password = '',
  });

  UserLogin copyWith({
    String? email,
    String? password,
  }) =>
      UserLogin(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
