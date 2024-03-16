import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<bool> signUp(String email, String password);

  Future<bool> signInWithPassword(String email, String password);

  Future<bool> signInWithOAuth(OAuthProvider provider);

  Stream<Session?> get sessionStream;

  Stream<User?> get profileStream;

  Stream<AuthState> get authStateStream;

  void cleanSession();
}
