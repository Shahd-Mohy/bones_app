import 'package:bloc/bloc.dart';
import 'package:bones_app/core/networking/chat_service.dart';
import 'package:bones_app/core/utils/shared_prefs_helper.dart';
import 'package:bones_app/features/Patient%20consultations/data/models/chat_overview_model.dart';
import 'package:meta/meta.dart';

part 'chat_overview_state.dart';

class ChatOverviewCubit extends Cubit<ChatOverviewState> {
  final ChatService chatService;

  ChatOverviewCubit(this.chatService) : super(ChatOverviewInitial());

  Future<void> fetchChatOverviews() async {
    emit(ChatOverviewLoading());

    try {
      final userId = await SharedPrefsHelper.getStringUserId();
      if (userId == null) {
        emit(ChatOverviewError("User ID not found."));
        return;
      }

      final response = await chatService.getAllMessages();

      final filtered = response
          .where((msg) => msg.receiverId == userId || msg.senderId == userId)
          .toList();

      final Map<String, ChatOverviewModel> latestChats = {};

      for (var message in filtered) {
        final otherUserId =
            message.senderId == userId ? message.receiverId : message.senderId;

        if (!latestChats.containsKey(otherUserId)) {
          latestChats[otherUserId] = message;
        }
      }

      final uniqueChats = latestChats.values.toList();

      emit(ChatOverviewLoaded(uniqueChats));
    } catch (e) {
      emit(ChatOverviewError("Failed to load chats: $e"));
    }
  }
}
