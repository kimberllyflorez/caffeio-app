import 'package:caffeio/app/router/app_router.dart';
import 'package:get_it/get_it.dart';

class DiNavigation {
  static Future<void> setUp(GetIt getIt) async {
    getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  }
}
