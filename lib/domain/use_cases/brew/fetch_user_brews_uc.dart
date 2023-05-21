import 'package:caffeio/data/repositories/brew_repository.abs.dart';
import 'package:caffeio/domain/use_cases.abs.dart';
import 'package:caffeio/domain/use_cases/auth/get_session_uc.dart';

class FetchUserBrewsUseCase extends NoParamsFutureUseCase<void> {
  final BrewRepository _repository;
  final GetSessionUseCase _getSessionUseCase;

  FetchUserBrewsUseCase(
    this._repository,
    this._getSessionUseCase,
  );

  @override
  Future<void> call() async {
    final session = await _getSessionUseCase().take(1).last;
    final userId = session?.user.id ?? '';
    if (userId.isNotEmpty) {
      return _repository.fetchUserBrews(userId);
    }
  }
}
