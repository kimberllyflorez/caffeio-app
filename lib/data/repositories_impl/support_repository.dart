import 'package:caffeio/data/data_source/support_data_source.dart';
import 'package:caffeio/data/repositories/support_repository.abs.dart';
import 'package:flutter/foundation.dart';

class SupportRepositoryImpl implements SupportRepository {
  final SupportDataSource _supportDataSource;

  SupportRepositoryImpl(this._supportDataSource);

  @override
  Future<bool> sendMessage(String email, String message) async {
    try {
      await _supportDataSource.sendMessage({
        'email': email,
        'message': message,
      });
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
