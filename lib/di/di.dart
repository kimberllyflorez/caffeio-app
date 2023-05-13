import 'package:caffeio/di/di_data_sources.dart';
import 'package:caffeio/di/di_navigation.dart';
import 'package:caffeio/di/di_respositories.dart';
import 'package:caffeio/di/di_adapters.dart';
import 'package:caffeio/di/di_use_cases.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

class DependencyInjection {
  Future<void> setup() async {
    await DiAdapters.setUp(locator);
    DiDataSources.setUp(locator);
    DiRepositories.setUp(locator);
    DiUseCase.setUp(locator);
    DiNavigation.setUp(locator);
  }
}
