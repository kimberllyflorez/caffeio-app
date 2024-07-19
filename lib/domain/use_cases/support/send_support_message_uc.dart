import 'package:caffeio/data/repositories/support_repository.abs.dart';
import 'package:caffeio/domain/use_cases.abs.dart';
import 'package:caffeio/entities/support/support_message_request.dart';

class SendSupportMessageUseCase
    extends FutureUseCase<bool, SupportMessageRequest> {
  final SupportRepository _supportRepository;

  SendSupportMessageUseCase(
    this._supportRepository,
  );

  @override
  Future<bool> call(SupportMessageRequest params) async {
    return _supportRepository.sendMessage(params.email, params.message);
  }
}
