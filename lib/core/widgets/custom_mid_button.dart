import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomMidButton extends StatelessWidget {
  const CustomMidButton(
      {super.key, required this.title, this.onPressed, this.width = 223});

  final String title;
  final void Function()? onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 48,
      decoration: BoxDecoration(
        color: kMidButtonColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
          child: Text(
        textAlign: TextAlign.center,
        title,
        style: Styles.textStyle15,
      )),
    );
  }
}
