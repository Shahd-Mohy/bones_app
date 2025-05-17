import 'package:bloc/bloc.dart';
import 'package:bones_app/core/networking/chat_service.dart';
import 'package:bones_app/features/chat/data/models/send_message_model.dart';
import 'package:meta/meta.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  final ChatService chatService;

  SendMessageCubit({required this.chatService}) : super(SendMessageInitial());

  Future<void> sendMessage(SendMessageRequest request) async {
    emit(SendMessageLoading());
    final response = await chatService.sendMessage(request);
    if (response != null && response.success) {
      emit(SendMessageSuccess(response.message));
    } else {
      emit(SendMessageFailure("Failed to send message"));
    }
  }
}
