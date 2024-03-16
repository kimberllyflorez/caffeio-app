import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseAdapter {
  Future<AuthResponse> signUp(String email, String password);

  Future<AuthResponse> signInWithPassword(String email, String password);

  Future<bool> signInWithOAuth(OAuthProvider provider);

  Future<void> logOut();

  Session? get currentSession;

  User? get currentUser;

  Stream<AuthState> get authStream;

  Future<List<dynamic>> selectAll(String table);

  Future<List<dynamic>> selectWhere(
      String table, String field, String condition);

  Future<void> insert(String tabla, Map<String, dynamic> body);
}

class SupabaseAdapterImpl implements SupabaseAdapter {
  final SupabaseClient _client;

  SupabaseAdapterImpl(this._client);

  @override
  Future<List<dynamic>> selectAll(String table) {
    return _client.from(table).select();
  }

  @override
  Future<AuthResponse> signUp(String email, String password) {
    return _client.auth.signUp(email: email, password: password);
  }

  @override
  Future<AuthResponse> signInWithPassword(String email, String password) {
    return _client.auth.signInWithPassword(email: email, password: password);
  }

  @override
  Future<bool> signInWithOAuth(OAuthProvider provider) {
    return _client.auth.signInWithOAuth(
      provider,
      redirectTo: 'bimblystudios.caffeio://login-callback/',
    );
  }

  @override
  User? get currentUser => _client.auth.currentUser;

  @override
  Session? get currentSession => _client.auth.currentSession;

  @override
  Stream<AuthState> get authStream => _client.auth.onAuthStateChange;

  @override
  Future<void> logOut() {
    return _client.auth.signOut();
  }

  @override
  Future<List<dynamic>> selectWhere(
    String table,
    String field,
    String condition,
  ) async {
    final result = await _client.from(table).select().eq(field, condition);
    return result;
  }

  @override
  Future<void> insert(String table, Map<String, dynamic> body) async {
    try {
      await _client.from(table).insert(body);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
