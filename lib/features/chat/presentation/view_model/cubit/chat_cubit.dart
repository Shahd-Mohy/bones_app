import 'package:bloc/bloc.dart';
import 'package:bones_app/core/networking/chat_service.dart';
import 'package:bones_app/features/chat/data/models/get_chat_model.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatService chatService;

  ChatCubit(this.chatService) : super(ChatInitial());

  Future<void> fetchChatMessages(String receiverId) async {
    emit(ChatLoading());

    final response = await chatService.fetchChatMessages(receiverId);
    if (response != null && response.success) {
      emit(ChatLoaded(messages: response.data));
    } else {
      emit(ChatError(errorMessage: 'Failed to load chat messages.'));
    }
  }
}

