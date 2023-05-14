import 'package:caffeio/adapters/supabase/supabase_adapter.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DiAdapters {
  static Future<void> setUp(GetIt getIt) async {
    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
    final supaBaseClient = Supabase.instance.client;
    getIt.registerSingleton<SupabaseAdapter>(
        SupabaseAdapterImpl(supaBaseClient));
  }
}
