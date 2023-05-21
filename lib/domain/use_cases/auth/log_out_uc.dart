import 'package:caffeio/data/repositories/auth_repository.abs.dart';
import 'package:caffeio/data/repositories/brew_repository.abs.dart';
import 'package:caffeio/domain/use_cases.abs.dart';

class LogOutUseCase extends NoParamsUseCase<void> {
  final AuthRepository _repository;
  final BrewRepository _brewRepository;

  LogOutUseCase(
    this._repository,
    this._brewRepository,
  );

  @override
  void call() {
    _repository.cleanSession();
    _brewRepository.clean();
  }
}
