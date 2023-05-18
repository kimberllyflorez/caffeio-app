import 'package:caffeio/data/repositories/auth_repository.abs.dart';
import 'package:caffeio/domain/use_cases.abs.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetProfileUseCase extends NoParamsStreamUseCase<User?>{

  final AuthRepository _repository;

  GetProfileUseCase(this._repository);

  @override
  Stream<User?> call() {
    return _repository.profileStream;
  }

}