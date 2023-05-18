import 'package:caffeio/data/repositories/auth_repository.abs.dart';
import 'package:caffeio/domain/models/auth/user_login.dart';
import 'package:caffeio/domain/use_cases.abs.dart';

class SignUpUseCase extends FutureUseCase<bool, UserLogin> {
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  @override
  Future<bool> call(UserLogin params) async {
    return _repository.signUp(params.email, params.password);
  }
}
