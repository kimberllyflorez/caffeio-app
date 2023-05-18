import 'package:caffeio/data/repositories/auth_repository.abs.dart';
import 'package:caffeio/domain/use_cases.abs.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetSessionUseCase extends NoParamsStreamUseCase<Session?> {
  final AuthRepository _repository;

  GetSessionUseCase(this._repository);

  @override
  Stream<Session?> call() {
    return _repository.sessionStream;
  }
}
