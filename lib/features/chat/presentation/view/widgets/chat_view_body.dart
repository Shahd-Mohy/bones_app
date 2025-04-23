import 'dart:io';

import 'package:bones_app/constants.dart';
import 'package:bones_app/features/chat/presentation/view/widgets/chat_bubble_reciever.dart';
import 'package:bones_app/features/chat/presentation/view/widgets/chat_bubble_sender.dart';
import 'package:flutter/material.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});
  //File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, builder) {
              return const Column(
                children: [
                  ChatBubbleSender(),
                  ChatBubbleReciever(),
                ],
              );
            },
            itemCount: 1,
            reverse: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Send Your Message!",
              prefixIcon: const Icon(Icons.link_sharp),
              suffixIcon: const Icon(Icons.send_rounded),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: kSecondaryColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: kSecondaryColor)),
            ),
          ),
        )
      ],
    );
  }
}
