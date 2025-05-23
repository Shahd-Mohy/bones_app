import 'package:bones_app/constants.dart';
import 'package:flutter/material.dart';

class ChatBubbleSender extends StatelessWidget {
  const ChatBubbleSender({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child:  Text(
          text,
          style:const TextStyle(
            color: Colors.black,
            fontSize: 16
          ),
        ),
      ),
    );
  }
}
