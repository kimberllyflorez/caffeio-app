import 'package:caffeio/adapters/supabase_adapter.dart';

abstract class SupportDataSource {
  Future<void> sendMessage(Map<String, dynamic> supportMessage);
}

class SupportDataSourceImpl extends SupportDataSource {
  final SupabaseAdapter _supabase;

  SupportDataSourceImpl(this._supabase);

  @override
  Future<void> sendMessage(Map<String, dynamic> supportMessage) async {
    await _supabase.insert('support_messages', supportMessage);
  }
}
