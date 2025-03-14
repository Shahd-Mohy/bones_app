import 'dart:io';
import 'package:bones_app/core/utils/assets.dart';
import 'package:bones_app/core/widgets/contacts_image.dart';
import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                ContactImage(
                  logo: Platform.isIOS ? AssetsData.apple : AssetsData.google,
                ),
                const Spacer(flex: 1),
                const ContactImage(
                  logo: AssetsData.facebook,
                ),
                const Spacer(flex: 3),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
