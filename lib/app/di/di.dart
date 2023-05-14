import 'package:caffeio/app/di/di_data_sources.dart';
import 'package:caffeio/app/di/di_respositories.dart';
import 'package:caffeio/app/di/di_adapters.dart';
import 'package:caffeio/app/di/di_use_cases.dart';
import 'package:caffeio/app/di/di_view_models.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

class DependencyInjection {
  static Future<void> setup() async {
    await DiAdapters.setUp(locator);
    DiDataSources.setUp(locator);
    DiRepositories.setUp(locator);
    DiUseCase.setUp(locator);
    DiViewModel.setUp(locator);
  }
}
