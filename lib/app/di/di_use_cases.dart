import 'package:caffeio/domain/use_cases/brewing_methods/fetch_brewing_methods_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/get_brewing_methods_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/get_user_brew_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/set_user_brew_uc.dart';
import 'package:caffeio/domain/use_cases/ratio/caculate_water_ratio_uc.dart';
import 'package:caffeio/domain/use_cases/timer/format_stopwatch_time_uc.dart';
import 'package:get_it/get_it.dart';

class DiUseCase {
  static Future<void> setUp(GetIt getIt) async {
    getIt.registerFactory(() => FetchBrewingMethodsUseCase(getIt.get()));
    getIt.registerFactory(() => GetBrewingMethodsUseCase(getIt.get()));
    getIt.registerFactory(() => FormatStopwatchTimeUseCase());
    getIt.registerFactory(() => CalculateWaterRatioUseCase());
    getIt.registerFactory(() => GetUserBrewUseCase(getIt.get()));
    getIt.registerFactory(() => SetUserBrewUseCase(getIt.get()));
  }
}
