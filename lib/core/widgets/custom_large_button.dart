import 'package:bones_app/constants.dart';
import 'package:flutter/material.dart';

class CustomLargeButton extends StatelessWidget {
  const CustomLargeButton(
      {super.key, required this.title, required this.onPressed});

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          color: kButtonColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(title,
              style: const TextStyle(
                  fontSize: 25,
                  color: Color(0xff2B2B29),
                  fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
