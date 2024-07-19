import 'package:caffeio/app/features/brew/ratio/ratio_model.dart';
import 'package:caffeio/data/repositories/brew_repository.abs.dart';
import 'package:caffeio/domain/use_cases.abs.dart';
import 'package:caffeio/domain/use_cases/auth/get_profile_uc.dart';

class SaveBrewUseCase extends FutureUseCase<void, RatioModelView> {
  final BrewRepository _brewRepository;
  final GetProfileUseCase _getProfileUseCase;

  SaveBrewUseCase(
    this._brewRepository,
    this._getProfileUseCase,
  );

  @override
  Future<void> call(RatioModelView params) async {
    final profile = await _getProfileUseCase().take(1).last;
    final userId = profile?.id ?? '';
    await _brewRepository.saveBrew(params, userId);
  }
}
