import 'package:caffeio/data/repositories/brewing_methods_repository.abs.dart';
import 'package:caffeio/domain/use_cases.abs.dart';

class FetchBrewingMethodsUseCase extends NoParamsVoidUseCase {
  final BrewingMethodsRepository _repository;

  FetchBrewingMethodsUseCase(this._repository);

  @override
  Future<void> call() => _repository.fetchBrewingMethods();
}
