import 'package:caffeio/app/router/guards/first_user_brew_guard.dart';
import 'package:get_it/get_it.dart';

class DiGuards {
  static Future<void> setUp(GetIt getIt) async {
    getIt.registerFactory(() => FirstUserBrewGuard(getIt.get()));
  }
}
