import 'package:caffeio/data/repositories/auth_repository.abs.dart';
import 'package:caffeio/domain/use_cases.abs.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetAuthStateUseCase extends NoParamsStreamUseCase<AuthState> {
  final AuthRepository _repository;

  GetAuthStateUseCase(this._repository);

  @override
  Stream<AuthState> call() {
    return _repository.authStateStream;
  }
}
