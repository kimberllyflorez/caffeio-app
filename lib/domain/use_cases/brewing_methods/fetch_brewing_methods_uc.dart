import 'package:caffeio/data/repositories/brewing_methods_repository.abs.dart';

class FetchBrewingMethodsUseCase {
  final BrewingMethodsRepository _repository;

  FetchBrewingMethodsUseCase(this._repository);

  Future<void> fetchBrewingMethods() => _repository.fetchBrewingMethods();
}
