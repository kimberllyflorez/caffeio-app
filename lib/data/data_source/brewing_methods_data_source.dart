import 'package:caffeio/adapters/supabase/supabase_adapter.dart';

abstract class BrewingMethodsDataSource {
  Future<List<dynamic>> fetchBrewingMethods();
}

class BrewingMethodsDataSourceImpl extends BrewingMethodsDataSource {
  final SupabaseAdapter _supabase;

  BrewingMethodsDataSourceImpl(this._supabase);

  @override
  Future<List<dynamic>> fetchBrewingMethods() {
    return _supabase.selectAll('brewing_methods');
  }
}
