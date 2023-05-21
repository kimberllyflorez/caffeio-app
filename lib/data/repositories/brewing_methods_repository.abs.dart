import 'package:caffeio/entities/brew/brewing_method.dart';
import 'package:caffeio/entities/brew/method_video.dart';

abstract class BrewingMethodsRepository {
  Future<void> fetchBrewingMethods();

  Future<dynamic> fetchMethodsVideos(int methodId);

  Stream<List<BrewingMethod>> get brewingMethodsStream;

  Stream<List<MethodVideo>> get methodsVideoStream;
}
