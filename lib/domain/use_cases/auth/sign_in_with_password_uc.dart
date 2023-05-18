import 'package:caffeio/data/repositories/auth_repository.abs.dart';
import 'package:caffeio/domain/models/auth/user_login.dart';
import 'package:caffeio/domain/use_cases.abs.dart';

class SignInWithPasswordUseCase extends FutureUseCase<bool, UserLogin> {
  final AuthRepository _repository;

  SignInWithPasswordUseCase(this._repository);

  @override
  Future<bool> call(UserLogin params) async {
    return _repository.signInWithPassword(params.email, params.password);
  }
}
