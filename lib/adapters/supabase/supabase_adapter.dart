import 'package:supabase_flutter/supabase_flutter.dart';

const String supabaseUrl = 'https://yrvlqdyomyadfxbguhgw.supabase.co';
const String supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlydmxxZHlvbXlhZGZ4Ymd1aGd3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODM5NjcxMDgsImV4cCI6MTk5OTU0MzEwOH0.VVwBN9C1UKiFI8wYF-f6qT3xZqWtM6-9ij_nXIyG6Mg';
// final String supabaseKey = String.fromEnvironment('SUPABASE_KEY')

abstract class SupabaseAdapter {
  Future<List<dynamic>> selectAll(String table);
}

class SupabaseAdapterImpl implements SupabaseAdapter {
  final SupabaseClient _client;

  SupabaseAdapterImpl(this._client);

  @override
  Future<List<dynamic>> selectAll(String table) {
    return _client.from(table).select();
  }
}
