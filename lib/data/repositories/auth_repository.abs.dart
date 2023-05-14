abstract class AuthRepository {
  Future<void> signUp(String email, String password);

  Future<void> signInWithPassword(String email, String password);
}
