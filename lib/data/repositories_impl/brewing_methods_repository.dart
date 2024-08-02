import 'package:caffeio/data/data_source/brewing_methods_data_source.dart';
import 'package:caffeio/data/data_source/methods_videos_data_source.dart';
import 'package:caffeio/data/repositories/brewing_methods_repository.abs.dart';
import 'package:caffeio/entities/brew/brewing_method.dart';
import 'package:caffeio/entities/brew/method_video.dart';
import 'package:rxdart/rxdart.dart';

class BrewingMethodsRepositoryImpl implements BrewingMethodsRepository {
  final BrewingMethodsDataSource _brewingMethodsDataSource;
  final MethodsVideosDataSource _methodsVideosDataSource;

  final _brewingMethods = BehaviorSubject<List<BrewingMethod>>();

  final _methodsVideos = BehaviorSubject<List<MethodVideo>>();

  BrewingMethodsRepositoryImpl(
    this._brewingMethodsDataSource,
    this._methodsVideosDataSource,
  );

  @override
  Stream<List<BrewingMethod>> get brewingMethodsStream => _brewingMethods;

  @override
  Stream<List<MethodVideo>> get methodsVideoStream => _methodsVideos;

  @override
  Future<void> fetchBrewingMethods() async {
    final data = await _brewingMethodsDataSource.fetchBrewingMethods();
    final brewingMethods = data.map((method) => BrewingMethodMapper.fromMap(method as Map<String, dynamic>)).toList();
    _brewingMethods.add(brewingMethods);
  }

  @override
  Future<void> fetchMethodsVideos(int methodId) async {
    final data = await _methodsVideosDataSource.fetchMethodsVideos(methodId);
    final result = data.map((videos) => MethodVideoMapper.fromMap(videos as Map<String, dynamic>)).toList();
    _methodsVideos.add(result);
  }
}
