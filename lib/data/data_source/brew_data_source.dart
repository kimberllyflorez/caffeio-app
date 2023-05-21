import 'package:caffeio/adapters/supabase_adapter.dart';

abstract class BrewDataSource {
  Future<List<dynamic>> fetchUserBrews(String userId);

  Future<void> insetBrew(Map<String, dynamic> brew);
}

class BrewDataSourceImpl extends BrewDataSource {
  final SupabaseAdapter _supabase;

  BrewDataSourceImpl(this._supabase);

  @override
  Future<List<dynamic>> fetchUserBrews(String userId) {
    return _supabase.selectWhere('brews', 'user_id', userId);
  }

  @override
  Future<void> insetBrew(Map<String, dynamic> brew) async {
    final newBrew = brew..remove('id')..remove('created_at');
    await _supabase.insert('brews', newBrew);
  }
}
