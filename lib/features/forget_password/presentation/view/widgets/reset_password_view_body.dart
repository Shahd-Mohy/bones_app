import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/widgets/custom_large_button.dart';
import 'package:bones_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Enter your New password',
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Center(
                    child: Text(
                      'And change your password',
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            const CustomTextFormField(
              label: "Create new password",
              hintText: "Make it strong..",
              sufIcon: Icon(Icons.remove_red_eye_outlined),
            ),
            const SizedBox(height: 10),
            const CustomTextFormField(
              sufIcon: Icon(Icons.remove_red_eye_outlined),
              label: "Confirm new password",
              hintText: "Confirm new password",
            ),
            const SizedBox(height: 10),
            CustomLargeButton(
              title: 'Login',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
