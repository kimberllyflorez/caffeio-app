import 'package:caffeio/app/brew/ratio/ratio_model.dart';
import 'package:caffeio/data/repositories/brew_repository.abs.dart';
import 'package:caffeio/domain/use_cases.abs.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/get_brewing_methods_uc.dart';

class GetUserBrewsUseCase extends NoParamsFutureUseCase<List<RatioModelView>> {
  final BrewRepository _repository;
  final GetBrewingMethodsUseCase _getBrewingMethodsUseCase;

  GetUserBrewsUseCase(
    this._repository,
    this._getBrewingMethodsUseCase,
  );

  @override
  Future<List<RatioModelView>> call() async {
    final methods = await _getBrewingMethodsUseCase().take(1).last;
    final userBrews = await _repository.userBrews.take(1).last;
    List<RatioModelView> brews = [];
    for (final userBrew in userBrews) {
      final brewMethod =
          methods.firstWhere((element) => element.id == userBrew.methodId);
      final brew = RatioModelView(
        method: brewMethod,
        water: userBrew.water,
        gramsCoffee: userBrew.coffeeGrams.toDouble(),
        ratio: userBrew.ratio,
        creationDate: userBrew.createdAt ?? DateTime.now(),
      );
      brews.add(brew);
    }
    return brews;
  }
}
