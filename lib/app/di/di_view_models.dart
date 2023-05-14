import 'package:caffeio/app/home/home_vm.dart';
import 'package:get_it/get_it.dart';

class DiViewModel {
  static Future<void> setUp(GetIt getIt) async {
    getIt.registerFactory<HomeViewModel>(() {
      return HomeViewModel(getIt.get(), getIt.get());
    });
  }
}
