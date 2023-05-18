import 'package:caffeio/adapters/storage_adapter.dart';
import 'package:caffeio/domain/use_cases.abs.dart';

class SetUserBrewUseCase extends NoParamsFutureUseCase<bool> {
  final Storage _storage;

  SetUserBrewUseCase(this._storage);

  @override
  Future<bool> call() async {
    return _storage.setBool('userBrew', true);
  }
}
