import 'package:caffeio/data/repositories/brew_repository.abs.dart';
import 'package:caffeio/domain/use_cases.abs.dart';
import 'package:caffeio/domain/use_cases/auth/get_profile_uc.dart';

class FetchUserBrewsUseCase extends NoParamsFutureUseCase<void> {
  final BrewRepository _repository;
  final GetProfileUseCase _getProfileUseCase;

  FetchUserBrewsUseCase(
    this._repository,
    this._getProfileUseCase,
  );

  @override
  Future<void> call() async {
    final profile = await _getProfileUseCase().take(1).last;
    final userId = profile?.id ?? '';
    if (userId.isNotEmpty) {
      await _repository.fetchUserBrews(userId);
    }
  }
}
