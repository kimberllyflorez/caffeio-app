import 'package:caffeio/entities/brew/brew.dart';

abstract class BrewRepository {
  Stream<List<Brew>> get userBrews;

  Future<void> fetchUserBrews(String userId);

  Future<void> saveBrew(Brew brew);
}
