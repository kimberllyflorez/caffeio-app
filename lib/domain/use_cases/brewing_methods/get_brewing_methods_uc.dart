import 'package:caffeio/data/repositories/brewing_methods_repository.abs.dart';
import 'package:caffeio/entities/brewing_methods/brewing_method.dart';

class GetBrewingMethodsUseCase {
  final BrewingMethodsRepository _repository;

  GetBrewingMethodsUseCase(this._repository);

  Stream<List<BrewingMethod>> call() {
    return _repository.brewingMethodsStream;
  }
}
