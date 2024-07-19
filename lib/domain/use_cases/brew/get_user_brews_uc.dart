import 'package:caffeio/app/features/brew/ratio/ratio_model.dart';
import 'package:caffeio/data/repositories/brew_repository.abs.dart';
import 'package:caffeio/domain/use_cases.abs.dart';

class GetUserBrewsUseCase extends NoParamsStreamUseCase<List<RatioModelView>> {
  final BrewRepository _repository;

  GetUserBrewsUseCase(
    this._repository,
  );

  @override
  Stream<List<RatioModelView>> call() {
    return _repository.userBrews;
  }
}
