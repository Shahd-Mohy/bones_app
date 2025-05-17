part of 'send_message_cubit.dart';

@immutable
sealed class SendMessageState {}

final class SendMessageInitial extends SendMessageState {}

class SendMessageLoading extends SendMessageState {}

class SendMessageSuccess extends SendMessageState {
  final String message;
  SendMessageSuccess(this.message);
}

class SendMessageFailure extends SendMessageState {
  final String error;
  SendMessageFailure(this.error);
}
