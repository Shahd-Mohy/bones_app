part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<ChatMessageModel> messages;

  ChatLoaded({required this.messages});
}

class ChatError extends ChatState {
  final String errorMessage;

  ChatError({required this.errorMessage});
}
