import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomMessageButton extends StatelessWidget {
  const CustomMessageButton(
      {super.key, required this.title, required this.onPressed});

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: Text(
          title,
          style:
              Styles.textStyle16.copyWith(fontSize: 17, color: kPrimaryColor),
        )),
      ),
    );
  }
}
