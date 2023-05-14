import 'package:caffeio/data/data_source/brewing_methods_data_source.dart';
import 'package:get_it/get_it.dart';

class DiDataSources {
  static Future<void> setUp(GetIt getIt) async {
    getIt.registerFactory<BrewingMethodsDataSource>(
        () => BrewingMethodsDataSourceImpl(getIt.get()));
  }
}
