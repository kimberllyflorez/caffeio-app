import 'package:caffeio/data/data_source/brew_data_source.dart';
import 'package:caffeio/data/repositories/brew_repository.abs.dart';
import 'package:caffeio/entities/brew/brew.dart';
import 'package:rxdart/rxdart.dart';

class BrewRepositoryImpl implements BrewRepository {
  final BrewDataSource _brewDataSource;

  final _userBrews = BehaviorSubject<List<Brew>>.seeded(const []);

  BrewRepositoryImpl(
    this._brewDataSource,
  );

  @override
  Stream<List<Brew>> get userBrews => _userBrews.stream;

  @override
  Future<void> fetchUserBrews(String userId) async {
    final data = await _brewDataSource.fetchUserBrews(userId);
    final brews = data
        .map((method) => Brew.fromJson(method as Map<String, dynamic>))
        .toList();
    _userBrews.add(brews);
  }

  @override
  Future<void> saveBrew(Brew brew) async {
    await _brewDataSource.insetBrew(brew.toJson());
  }
}
