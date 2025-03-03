import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomMiniButton extends StatelessWidget {
  const CustomMiniButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 48,
        width: 140,
        decoration: BoxDecoration(
          color: kMiniButtonColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            title,
            style: Styles.textStyle15,
          ),
        ),
      ),
      onTap:  onPressed,
    );
  }
}
