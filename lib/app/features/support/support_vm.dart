import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/domain/use_cases/support/send_support_message_uc.dart';
import 'package:caffeio/entities/support/support_message_request.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

class SupportPageState extends Equatable {
  final String? email;
  final String? message;

  const SupportPageState({
    this.email,
    this.message,
  });

  SupportPageState copyWith({
    String? email,
    String? message,
  }) =>
      SupportPageState(
        email: email ?? this.email,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [
        email,
        message,
      ];
}

class SupportViewModel extends ViewModel {
  final SendSupportMessageUseCase _sendSupportMessageUseCase;

  final _state = BehaviorSubject<SupportPageState>.seeded(
    const SupportPageState(),
  );

  Stream<SupportPageState> get state => _state.stream;

  SupportViewModel(
    this._sendSupportMessageUseCase,
  );

  @override
  void init() {}

  void onEmailChanged(String email) {
    _state.add(_state.value.copyWith(email: email));
  }

  void onMessageChanged(String message) {
    _state.add(_state.value.copyWith(message: message));
  }

  void onSendMessagePressed() {
    _sendSupportMessageUseCase(
      SupportMessageRequest(
        email: _state.value.email!,
        message: _state.value.message!,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
