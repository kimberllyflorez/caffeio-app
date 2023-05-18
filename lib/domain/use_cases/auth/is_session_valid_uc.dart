import 'package:caffeio/domain/use_cases.abs.dart';
import 'package:caffeio/domain/use_cases/auth/get_session_uc.dart';

class IsSessionValidUseCase extends NoParamsFutureUseCase<bool> {
  final GetSessionUseCase _getSessionUseCase;

  IsSessionValidUseCase(this._getSessionUseCase);

  @override
  Future<bool> call() async {
    final sessionStream = await _getSessionUseCase().take(1).last;
    return sessionStream != null;
  }
}
