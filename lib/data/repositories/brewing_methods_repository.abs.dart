import 'package:caffeio/entities/brewing_methods/brewing_method.dart';

abstract class BrewingMethodsRepository {
  Future<void> fetchBrewingMethods();

  Stream<List<BrewingMethod>> get brewingMethodsStream;
}
