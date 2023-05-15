import 'package:caffeio/data/repositories/brewing_methods_repository.abs.dart';
import 'package:caffeio/domain/use_cases.abs.dart';
import 'package:caffeio/entities/brewing_methods/brewing_method.dart';

class GetBrewingMethodsUseCase
    extends NoParamsStreamUseCase<List<BrewingMethod>> {
  final BrewingMethodsRepository _repository;

  GetBrewingMethodsUseCase(this._repository);

  @override
  Stream<List<BrewingMethod>> call() {
    return _repository.brewingMethodsStream;
  }
}
