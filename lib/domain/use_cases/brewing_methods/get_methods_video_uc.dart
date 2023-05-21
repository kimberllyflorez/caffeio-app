import 'package:caffeio/data/repositories/brewing_methods_repository.abs.dart';
import 'package:caffeio/domain/use_cases.abs.dart';
import 'package:caffeio/entities/brew/method_video.dart';

class GetMethodVideosUseCase extends NoParamsStreamUseCase<List<MethodVideo>> {
  final BrewingMethodsRepository _repository;

  GetMethodVideosUseCase(this._repository);

  @override
  Stream<List<MethodVideo>> call() {
    return _repository.methodsVideoStream;
  }
}
