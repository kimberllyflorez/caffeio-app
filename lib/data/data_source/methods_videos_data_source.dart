import 'package:caffeio/adapters/supabase_adapter.dart';

abstract class MethodsVideosDataSource {
  Future<List<dynamic>> fetchMethodsVideos(int methodId);
}

class MethodsVideosDataSourceImpl extends MethodsVideosDataSource {
  final SupabaseAdapter _supabase;

  MethodsVideosDataSourceImpl(this._supabase);

  @override
  Future<List<dynamic>> fetchMethodsVideos(int methodId) {
    return _supabase.selectWhere(
      'methods_videos',
      'method_id',
      methodId.toString(),
    );
  }
}
