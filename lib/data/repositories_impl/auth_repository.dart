import 'package:caffeio/adapters/secure_storage_adapter.dart';
import 'package:caffeio/adapters/supabase_adapter.dart';
import 'package:caffeio/data/repositories/auth_repository.abs.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseAdapter _client;
  final SecureStorage _storage;

  final _sessionSubject = BehaviorSubject<Session?>();

  Stream<Session?> get sessionStream => _sessionSubject;

  final _userSubject = BehaviorSubject<User?>();

  Stream<User?> get profileStream => _userSubject;

  AuthRepositoryImpl(this._client, this._storage);

  @override
  Future<void> signInWithPassword(String email, String password) async {
    final AuthResponse res = await _client.signInWithPassword(email, password);
    final Session? session = res.session;
    final User? user = res.user;
    _emitSessionUser((session, user));
    _persistSession(session);
  }

  @override
  Future<void> signUp(String email, String password) async {
    final AuthResponse res = await _client.signUp(email, password);
    final Session? session = res.session;
    final User? user = res.user;
    _emitSessionUser((session, user));
    _persistSession(session);
  }

  void _emitSessionUser((Session?, User?) data) {
    _sessionSubject.add(data.$1);
    _userSubject.add(data.$2);
  }

  void _persistSession(Session? session) {
    _storage.setString('session', session!.persistSessionString);
  }
}
