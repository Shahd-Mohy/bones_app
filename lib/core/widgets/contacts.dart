import 'package:bones_app/core/utils/assets.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/widgets/contacts_image.dart';
import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 120,
        width: 185,
        child: Column(
          children: [
            Center(
              child: Text(
                "- OR Continue with -",
                style: Styles.hintTextStyle.copyWith(color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContactImage(logo: AssetsData.facebook),
                Spacer(
                  flex: 1,
                ),
                ContactImage(logo: AssetsData.google),
                Spacer(
                  flex: 1,
                ),
                ContactImage(logo: AssetsData.apple),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
