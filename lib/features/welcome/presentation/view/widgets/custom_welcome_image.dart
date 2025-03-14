import 'package:bones_app/core/widgets/custom_mini_button.dart';
import 'package:flutter/material.dart';

class CustomWelcomeImage extends StatelessWidget {
  const CustomWelcomeImage(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.onPressed});
  final String title;
  final String imagePath;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MediaQuery.of(context).size.height * 0.4,
      //width: MediaQuery.of(context).size.width*,
      child: Column(
        children: [
          Image.asset(imagePath),
          const SizedBox(
            height: 20,
          ),
          CustomMiniButton(title: title, onPressed: onPressed),
        ],
      ),
    );
  }
}
