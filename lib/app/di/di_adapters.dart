import 'package:caffeio/adapters/secure_storage_adapter.dart';
import 'package:caffeio/adapters/storage_adapter.dart';
import 'package:caffeio/adapters/supabase_adapter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DiAdapters {
  static Future<void> setUp(GetIt getIt) async {
    const String supabaseUrl = 'https://yrvlqdyomyadfxbguhgw.supabase.co';

    const supabaseKey = String.fromEnvironment(
      'SUPABASE_KEY',
      defaultValue: 'SOME_DEFAULT_VALUE',
    );
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseKey,
    );
    final supabaseClient = Supabase.instance.client;

    getIt.registerSingleton<SupabaseAdapter>(
      SupabaseAdapterImpl(supabaseClient),
    );

    const storage = FlutterSecureStorage();
    getIt.registerSingleton<SecureStorage>(SecureStorageImpl(storage));

    final preferences = await SharedPreferences.getInstance();
    getIt.registerSingleton<Storage>(StorageImpl(preferences));
  }
}
