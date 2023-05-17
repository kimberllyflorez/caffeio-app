import 'package:caffeio/domain/use_cases/brewing_methods/fetch_brewing_methods_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/get_brewing_methods_uc.dart';
import 'package:caffeio/domain/use_cases/ratio/ratio_calculate_water.dart';
import 'package:caffeio/domain/use_cases/timer/timer_formated_use_case.dart';
import 'package:get_it/get_it.dart';

class DiUseCase {
  static Future<void> setUp(GetIt getIt) async {
    getIt.registerFactory<FetchBrewingMethodsUseCase>(
        () => FetchBrewingMethodsUseCase(getIt.get()));
    getIt.registerFactory<GetBrewingMethodsUseCase>(
        () => GetBrewingMethodsUseCase(getIt.get()));
    getIt.registerFactory<TimerFormatUseCase>(
      () => TimerFormatUseCase(),
    );
    getIt.registerFactory<RatioCalculateWater>(() => RatioCalculateWater());
  }
}
