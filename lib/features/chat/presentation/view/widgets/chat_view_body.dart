import 'package:bones_app/constants.dart';
import 'package:bones_app/features/chat/data/models/get_chat_model.dart';
import 'package:bones_app/features/chat/data/models/send_message_model.dart';
import 'package:bones_app/features/chat/presentation/view/widgets/chat_bubble_reciever.dart';
import 'package:bones_app/features/chat/presentation/view/widgets/chat_bubble_sender.dart';
import 'package:bones_app/features/chat/presentation/view_model/cubit/chat_cubit.dart';
import 'package:bones_app/features/chat/presentation/view_model/cubit/send_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatViewBody extends StatefulWidget {
  final String receiverId;

  const ChatViewBody({super.key, required this.receiverId});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  String? _senderId;
  List<ChatMessageModel> _messages = [];

  @override
  void initState() {
    super.initState();
    _loadSenderId();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatCubit>().fetchChatMessages(widget.receiverId);
    });
  }

  Future<void> _loadSenderId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _senderId = prefs.getString('userStringId');
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage() {
    final content = _messageController.text.trim();
    if (content.isEmpty || _senderId == null) return;

    final now = DateTime.now();

    final localMessage = ChatMessageModel(
      content: content,
      senderId: _senderId!,
      receiverId: widget.receiverId,
      sentAt: now.toIso8601String(),
    );

    setState(() {
      _messages.add(localMessage); // ✅ Add locally
    });

    _messageController.clear();
    _scrollToBottom();

    final request = SendMessageRequest(
      content: content,
      receiverId: widget.receiverId,
      sentAt: now,
    );

    context.read<SendMessageCubit>().sendMessage(request);
  }

  String formatTime(String sentAt) {
    try {
      final date = DateTime.parse(sentAt);
      return DateFormat.jm().format(date);
    } catch (_) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: BlocListener<ChatCubit, ChatState>(
          listener: (context, state) {
            if (state is ChatLoaded) {
              setState(() {
                _messages = state.messages
                  ..sort(
                      (a, b) => a.sentAt.compareTo(b.sentAt)); // Oldest first
              });
              _scrollToBottom();
            }
          },
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _messages.length,
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context, index) {
              final message = _messages[index];
              final isSender = message.senderId == _senderId;
              final time = formatTime(message.sentAt);

              return Column(
                crossAxisAlignment: isSender
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  isSender
                      ? ChatBubbleSender(text: message.content)
                      : ChatBubbleReciever(text: message.content),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      time,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              );
            },
          ),
        )),
        BlocListener<SendMessageCubit, SendMessageState>(
          listener: (context, state) {
            if (state is SendMessageFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _messageController,
              onSubmitted: (_) => _sendMessage(),
              decoration: InputDecoration(
                hintText: "Send Your Message!",
                prefixIcon: const Icon(Icons.link_sharp),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send_rounded),
                  onPressed: _sendMessage,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: kSecondaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: kSecondaryColor),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
