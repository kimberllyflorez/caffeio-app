import 'package:caffeio/adapters/supabase_adapter.dart';

abstract class BrewingMethodsDataSource {
  Future<List<dynamic>> fetchBrewingMethods();

  Future<void> insetBrew(Map<String, dynamic> brew);
}

class BrewingMethodsDataSourceImpl extends BrewingMethodsDataSource {
  final SupabaseAdapter _supabase;

  BrewingMethodsDataSourceImpl(this._supabase);

  @override
  Future<List<dynamic>> fetchBrewingMethods() {
    return _supabase.selectAll('brewing_methods');
  }

  @override
  Future<void> insetBrew(Map<String, dynamic> brew) async {
    await _supabase.insert('brews', brew);
  }
}
