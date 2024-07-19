import 'package:caffeio/app/features/auth/login/login_page_vm.dart';
import 'package:caffeio/app/features/brew/methods_selection/method_selection_vm.dart';
import 'package:caffeio/app/features/brew/ratio/ratio_vm.dart';
import 'package:caffeio/app/features/brew/recommendations/recommendations_vm.dart';
import 'package:caffeio/app/features/brew/timer/timer_vm.dart';
import 'package:caffeio/app/features/home/home_vm.dart';
import 'package:caffeio/app/features/method/method_page_vm.dart';
import 'package:caffeio/app/features/onboarding/onboarding_page_vm.dart';
import 'package:caffeio/app/features/settings/settings_vm.dart';
import 'package:caffeio/app/features/support/support_vm.dart';
import 'package:get_it/get_it.dart';

class DiViewModel {
  static Future<void> setUp(GetIt getIt) async {
    getIt.registerFactory(() {
      return HomeViewModel(
        getIt.get(),
        getIt.get(),
        getIt.get(),
        getIt.get(),
        getIt.get(),
        getIt.get(),
      );
    });
    getIt.registerFactory(() => SettingsViewModel(getIt.get(), getIt.get()));
    getIt.registerFactory(() => LoginPageViewModel(
          getIt.get(),
          getIt.get(),
          getIt.get(),
          getIt.get(),
        ));
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
        getIt.get(),
      );
    });
    getIt.registerFactory(() {
      return MethodPageViewModel();
    });
    getIt.registerFactory(() {
      return OnboardingPageViewModel();
    });
    getIt.registerFactory(() {
      return SupportViewModel(getIt.get());
    });
  }
}
