import 'package:caffeio/data/data_source/brewing_methods_data_source.dart';
import 'package:caffeio/data/repositories/brewing_methods_repository.abs.dart';
import 'package:caffeio/entities/brewing_methods/brewing_method.dart';
import 'package:rxdart/rxdart.dart';

class BrewingMethodsRepositoryImpl implements BrewingMethodsRepository {

  final BrewingMethodsDataSource _dataSource;

  final _brewingMethods = BehaviorSubject<List<BrewingMethod>>();

  @override
  Stream<List<BrewingMethod>> get brewingMethodsStream => _brewingMethods.stream;

  BrewingMethodsRepositoryImpl(this._dataSource);

  @override
  Future<void> fetchBrewingMethods() async {
    final data = await _dataSource.fetchBrewingMethods();
    final brewingMethods = data.map((method) => BrewingMethod.fromJson(method as Map<String, dynamic>)).toList();
    _brewingMethods.add(brewingMethods);
  }
}
