import 'package:caffeio/app/brew/ratio/ratio_model.dart';
import 'package:caffeio/data/data_source/brew_data_source.dart';
import 'package:caffeio/data/repositories/brew_repository.abs.dart';
import 'package:caffeio/data/repositories/brewing_methods_repository.abs.dart';
import 'package:caffeio/entities/brew/brew.dart';
import 'package:rxdart/rxdart.dart';

class BrewRepositoryImpl implements BrewRepository {
  final BrewDataSource _brewDataSource;
  final BrewingMethodsRepository _brewingMethodsRepository;

  final _userBrews = BehaviorSubject<List<RatioModelView>>.seeded([]);

  List<RatioModelView> _brews = [];

  BrewRepositoryImpl(
    this._brewDataSource,
    this._brewingMethodsRepository,
  );

  @override
  Stream<List<RatioModelView>> get userBrews => _userBrews.stream;

  @override
  Future<void> fetchUserBrews(String userId) async {
    final data = await _brewDataSource.fetchUserBrews(userId);
    final userBrews = data
        .map((method) => Brew.fromJson(method as Map<String, dynamic>))
        .toList();
    List<RatioModelView> brews = [];
    final methods =
        await _brewingMethodsRepository.brewingMethodsStream.take(1).last;
    for (final userBrew in userBrews) {
      final brewMethod =
          methods.firstWhere((element) => element.id == userBrew.methodId);
      final brew = RatioModelView(
        method: brewMethod,
        water: userBrew.water,
        gramsCoffee: userBrew.coffeeGrams.toDouble(),
        ratio: userBrew.ratio,
        creationDate: userBrew.createdAt ?? DateTime.now(),
      );
      brews.add(brew);
    }
    _brews = brews;
    _emitBrews();
  }

  @override
  Future<void> saveBrew(RatioModelView brew, String userId) async {
    _brews.add(brew);
    _emitBrews();
    final newBrew = Brew(
      methodId: brew.method.id,
      ratio: brew.ratio,
      water: brew.water,
      coffeeGrams: brew.gramsCoffee.toInt(),
      userId: userId,
    );
    await _brewDataSource.insetBrew(newBrew.toJson());
  }

  void _emitBrews() {
    _userBrews.add(_brews);
  }

  @override
  void clean() {
    _userBrews.add([]);
    _brews = [];
  }
}
