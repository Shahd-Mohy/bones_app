import 'package:bones_app/constants.dart';
import 'package:flutter/material.dart';

class ContactImage extends StatelessWidget {
  const ContactImage({super.key, required this.logo});

  final String logo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: kPrimaryColor,
      ),
      child: Center(
        child: Image(
          image: AssetImage(logo),
          width: 40,
          height: 40,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
