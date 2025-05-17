import 'package:bones_app/constants.dart';
import 'package:bones_app/core/networking/chat_service.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/chat/presentation/view/widgets/chat_view_body.dart';
import 'package:bones_app/features/chat/presentation/view_model/cubit/chat_cubit.dart';
import 'package:bones_app/features/chat/presentation/view_model/cubit/send_message_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
    required this.receiverId,
    required this.doctorName,
  });

  final String receiverId;
  final String doctorName;

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final chatService = ChatService(dio: dio);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ChatCubit(chatService)..fetchChatMessages(receiverId)),
        BlocProvider(create: (_) => SendMessageCubit(chatService: chatService)),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: Text(doctorName, style: Styles.textStyle20),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, size: 30),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ChatViewBody(receiverId: receiverId),
      ),
    );
  }
}
