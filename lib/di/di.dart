import 'package:caffeio/di/di_navigation.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

class DependencyInjection {
  void setup() {
    DiNavigation.setUp(locator);
  }
}