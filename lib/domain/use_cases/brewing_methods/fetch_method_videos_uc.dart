import 'package:caffeio/data/repositories/brewing_methods_repository.abs.dart';
import 'package:caffeio/domain/use_cases.abs.dart';

class FetchMethodVideosUseCase extends FutureUseCase<void, int> {
  final BrewingMethodsRepository _repository;

  FetchMethodVideosUseCase(this._repository);

  @override
  Future<void> call(int params) => _repository.fetchMethodsVideos(params);
}
