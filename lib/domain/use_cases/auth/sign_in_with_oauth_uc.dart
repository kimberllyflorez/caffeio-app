import 'package:caffeio/data/repositories/auth_repository.abs.dart';
import 'package:caffeio/domain/use_cases.abs.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInWithOAuthUseCase extends FutureUseCase<bool, OAuthProvider> {
  final AuthRepository _repository;

  SignInWithOAuthUseCase(this._repository);

  @override
  Future<bool> call(OAuthProvider params) {
    return _repository.signInWithOAuth(params);
  }
}
