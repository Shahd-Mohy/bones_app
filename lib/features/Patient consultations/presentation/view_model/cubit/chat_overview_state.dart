part of 'chat_overview_cubit.dart';

@immutable
sealed class ChatOverviewState {}

class ChatOverviewInitial extends ChatOverviewState {}

class ChatOverviewLoading extends ChatOverviewState {}

class ChatOverviewLoaded extends ChatOverviewState {
  final List<ChatOverviewModel> chats;
  ChatOverviewLoaded(this.chats);
}

class ChatOverviewError extends ChatOverviewState {
  final String message;
  ChatOverviewError(this.message);
}
