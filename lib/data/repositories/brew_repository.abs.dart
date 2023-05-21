import 'package:caffeio/app/brew/ratio/ratio_model.dart';

abstract class BrewRepository {
  Stream<List<RatioModelView>> get userBrews;

  Future<void> fetchUserBrews(String userId);

  Future<void> saveBrew(RatioModelView brew, String userId);

  void clean();
}
