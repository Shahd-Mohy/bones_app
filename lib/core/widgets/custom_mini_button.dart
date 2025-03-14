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
      onTap: onPressed,
      child: Container(
        height: 48,
        width: 140,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: kIconSoftGreyColor.withOpacity(0.5),
              spreadRadius: 0,
              offset: const Offset(0, 6),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            title,
            style: Styles.textStyle15,
          ),
        ),
      ),
    );
  }
}
