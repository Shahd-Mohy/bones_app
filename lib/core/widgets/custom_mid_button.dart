import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomMidButton extends StatelessWidget {
  const CustomMidButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.width = 223,
    this.color,
  });

  final String title;
  final void Function() onPressed;
  final double width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: 48,
        decoration: BoxDecoration(
          color: color ?? kSecondaryColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: kSecondaryColor.withOpacity(0.7)),
        ),
        child: Center(
            child: Text(
          textAlign: TextAlign.center,
          title,
          style: Styles.textStyle15,
        )),
      ),
    );
  }
}
