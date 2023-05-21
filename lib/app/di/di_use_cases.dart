import 'package:caffeio/domain/use_cases/auth/get_profile_uc.dart';
import 'package:caffeio/domain/use_cases/auth/get_session_uc.dart';
import 'package:caffeio/domain/use_cases/auth/is_session_valid_uc.dart';
import 'package:caffeio/domain/use_cases/auth/log_out_uc.dart';
import 'package:caffeio/domain/use_cases/auth/sign_in_with_oauth_uc.dart';
import 'package:caffeio/domain/use_cases/auth/sign_in_with_password_uc.dart';
import 'package:caffeio/domain/use_cases/auth/sign_up_uc.dart';
import 'package:caffeio/domain/use_cases/brew/fetch_user_brews_uc.dart';
import 'package:caffeio/domain/use_cases/brew/get_user_brews_uc.dart';
import 'package:caffeio/domain/use_cases/brew/save_brew_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/fetch_brewing_methods_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/fetch_method_videos_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/get_brewing_methods_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/get_methods_video_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/get_user_brew_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/set_user_brew_uc.dart';
import 'package:caffeio/domain/use_cases/ratio/caculate_water_ratio_uc.dart';
import 'package:caffeio/domain/use_cases/timer/format_stopwatch_time_uc.dart';
import 'package:get_it/get_it.dart';

class DiUseCase {
  static Future<void> setUp(GetIt getIt) async {
    getIt.registerFactory(() => SignUpUseCase(getIt.get()));
    getIt.registerFactory(() => SignInWithPasswordUseCase(getIt.get()));
    getIt.registerFactory(() => SignInWithOAuthUseCase(getIt.get()));
    getIt.registerFactory(() => GetSessionUseCase(getIt.get()));
    getIt.registerFactory(() => IsSessionValidUseCase(getIt.get()));
    getIt.registerFactory(() => GetProfileUseCase(getIt.get()));
    getIt.registerFactory(() => LogOutUseCase(getIt.get(), getIt.get()));
    getIt.registerFactory(() => FetchBrewingMethodsUseCase(getIt.get()));
    getIt.registerFactory(() => GetBrewingMethodsUseCase(getIt.get()));
    getIt.registerFactory(() => FormatStopwatchTimeUseCase());
    getIt.registerFactory(() => CalculateWaterRatioUseCase());
    getIt.registerFactory(() => GetUserBrewUseCase(getIt.get()));
    getIt.registerFactory(() => SetUserBrewUseCase(getIt.get()));
    getIt.registerFactory(() => FetchMethodVideosUseCase(getIt.get()));
    getIt.registerFactory(() => GetMethodVideosUseCase(getIt.get()));
    getIt.registerFactory(() => SaveBrewUseCase(getIt.get(), getIt.get()));
    getIt.registerFactory(
      () => FetchUserBrewsUseCase(getIt.get(), getIt.get()),
    );
    getIt.registerFactory(() => GetUserBrewsUseCase(getIt.get()));
  }
}
