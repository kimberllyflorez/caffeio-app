import 'dart:convert';

import 'package:caffeio/adapters/secure_storage_adapter.dart';
import 'package:caffeio/adapters/supabase_adapter.dart';
import 'package:caffeio/data/repositories/auth_repository.abs.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final sessionKey = 'session';
  final profileKey = 'profile';

  final SupabaseAdapter _client;
  final SecureStorage _storage;

  final _sessionSubject = BehaviorSubject<Session?>();

  @override
  Stream<Session?> get sessionStream => _sessionSubject;

  final _userSubject = BehaviorSubject<User?>();

  @override
  Stream<User?> get profileStream => _userSubject;

  AuthRepositoryImpl(this._client, this._storage) {
    _loadProfileFromCache();
    _loadSessionFromCache();
  }

  @override
  Future<bool> signInWithPassword(String email, String password) async {
    try {
      final AuthResponse res =
          await _client.signInWithPassword(email, password);
      final Session? session = res.session;
      final User? user = res.user;
      if (session != null && user != null) {
        _emitSessionUser((session, user));
        _persistSessionUser((session, user));
        return true;
      }
      return false;
    } catch (e) {
      return await signUp(email, password);
    }
  }

  @override
  Future<bool> signUp(String email, String password) async {
    try {
      final AuthResponse res = await _client.signUp(email, password);
      final Session? session = res.session;
      final User? user = res.user;
      if (session != null && user != null) {
        _emitSessionUser((session, user));
        _persistSessionUser((session, user));
        return true;
      }
      return false;
    } catch (err) {
      ///TODO: Handle errors
      // If login fogin
      return await signInWithPassword(email, password);
    }
  }

  void _emitSessionUser((Session, User) data) {
    _sessionSubject.add(data.$1);
    _userSubject.add(data.$2);
  }

  void _persistSessionUser((Session session, User user) data) {
    _storage.setString(sessionKey, jsonEncode(data.$1.toJson()));
    _storage.setString(profileKey, jsonEncode(data.$2.toJson()));
  }

  Future<void> _loadProfileFromCache() async {
    final profileJson = await _storage.getString(profileKey);
    User? user;
    if (profileJson != null) {
      user = User.fromJson(jsonDecode(profileJson) as Map<String, dynamic>);
    }
    _userSubject.add(user);
  }

  Future<void> _loadSessionFromCache() async {
    final sessionJson = await _storage.getString(sessionKey);
    Session? session;
    if (sessionJson != null) {
      session =
          Session.fromJson(jsonDecode(sessionJson) as Map<String, dynamic>);
    }
    _sessionSubject.add(session);
  }

  @override
  void cleanSession() {
    _storage.remove(sessionKey);
    _storage.remove(profileKey);
    _sessionSubject.add(null);
    _userSubject.add(null);
    _client.logOut();
  }
}
