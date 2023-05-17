import 'package:caffeio/app/brew/methods_selection/method_selection_vm.dart';
import 'package:caffeio/app/brew/ratio/ratio_vm.dart';
import 'package:caffeio/app/brew/recommendations/recommendations_vm.dart';
import 'package:caffeio/app/auth/login/login_vm.dart';
import 'package:caffeio/app/brew/method_selection_vm.dart';
import 'package:caffeio/app/brew/ratio_vm.dart';
import 'package:caffeio/app/brew/recommendations_vm.dart';
import 'package:caffeio/app/home/home_vm.dart';
import 'package:caffeio/app/settings/settings_vm.dart';
import 'package:get_it/get_it.dart';

import '../brew/timer/timer_vm.dart';

class DiViewModel {
  static Future<void> setUp(GetIt getIt) async {
    getIt.registerFactory<HomeViewModel>(() {
      return HomeViewModel(getIt.get(), getIt.get());
    });
    getIt.registerFactory<SettingsViewModel>(() {
      return SettingsViewModel();
    });
    getIt.registerFactory<LoginViewModel>(() {
      return LoginViewModel();
    });

    getIt.registerFactory<MethodSelectionViewModel>(() {
      return MethodSelectionViewModel(getIt.get());
    });

    getIt.registerFactory<RatioViewModel>((){
      return RatioViewModel(getIt.get());
    });
    getIt.registerFactory<RecommendationViewModel>((){
      return RecommendationViewModel();
    });
    getIt.registerFactory<TimerViewModel>(() {return TimerViewModel(getIt.get());});
  }
}
