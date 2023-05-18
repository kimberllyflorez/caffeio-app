import 'package:caffeio/data/repositories/auth_repository.abs.dart';
import 'package:caffeio/domain/use_cases.abs.dart';

class LogOutUseCase extends NoParamsUseCase<void> {
  final AuthRepository _repository;

  LogOutUseCase(this._repository);

  @override
  void call() {
    _repository.cleanSession();
  }
}
