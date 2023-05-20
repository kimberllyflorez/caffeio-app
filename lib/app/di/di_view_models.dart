import 'package:caffeio/app/brew/methods_selection/method_selection_vm.dart';
import 'package:caffeio/app/brew/ratio/ratio_vm.dart';
import 'package:caffeio/app/brew/recommendations/recommendations_vm.dart';
import 'package:caffeio/app/auth/login/login_page_vm.dart';
import 'package:caffeio/app/home/home_vm.dart';
import 'package:caffeio/app/settings/settings_vm.dart';
import 'package:get_it/get_it.dart';

import '../brew/timer/timer_vm.dart';

class DiViewModel {
  static Future<void> setUp(GetIt getIt) async {
    getIt.registerFactory(() {
      return HomeViewModel(
        getIt.get(),
        getIt.get(),
        getIt.get(),
      );
    });
    getIt.registerFactory(() => SettingsViewModel(getIt.get(), getIt.get()));
    getIt.registerFactory(() => LoginPageViewModel(getIt.get()));
    getIt.registerFactory(() => MethodSelectionViewModel(
          getIt.get(),
          getIt.get(),
        ));
    getIt.registerFactory(() => RatioViewModel(getIt.get()));
    getIt.registerFactory(() {
      return RecommendationViewModel(
        getIt.get(),
        getIt.get(),
      );
    });
    getIt.registerFactory(() {
      return TimerViewModel(
        getIt.get(),
        getIt.get(),
        getIt.get(),
      );
    });
  }
}
