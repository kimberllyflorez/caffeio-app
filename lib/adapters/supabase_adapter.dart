import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const String supabaseUrl = 'https://yrvlqdyomyadfxbguhgw.supabase.co';
const String supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlydmxxZHlvbXlhZGZ4Ymd1aGd3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODM5NjcxMDgsImV4cCI6MTk5OTU0MzEwOH0.VVwBN9C1UKiFI8wYF-f6qT3xZqWtM6-9ij_nXIyG6Mg';
// final String supabaseKey = String.fromEnvironment('SUPABASE_KEY')

abstract class SupabaseAdapter {
  Future<AuthResponse> signUp(String email, String password);

  Future<AuthResponse> signInWithPassword(String email, String password);

  Future<List<dynamic>> selectAll(String table);

  Future<void> logOut();

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
  Future<void> logOut() {
    return _client.auth.signOut();
  }

  @override
  Future<List<dynamic>> selectWhere(
    String table,
    String field,
    String condition,
  ) async {
    final result =
        await _client.from(table).select<List<dynamic>>().eq(field, condition);
    return result;
  }

  @override
  Future<void> insert(String table, Map<String, dynamic> body) async {
    try{
      await _client.from(table).insert(body);
    }catch(e){
      debugPrint(e.toString());
    }
  }
}