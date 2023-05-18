import 'package:caffeio/adapters/storage_adapter.dart';
import 'package:caffeio/domain/use_cases.abs.dart';

class GetUserBrewUseCase extends NoParamsUseCase<bool?> {
  final Storage _storage;

  GetUserBrewUseCase(this._storage);

  @override
  bool? call() {
    return _storage.getBool('userBrew');
  }
}
