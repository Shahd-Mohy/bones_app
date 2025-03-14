import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/widgets/custom_large_button.dart';
import 'package:bones_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

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
                      'Enter your email or phone number',
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Center(
                    child: Text(
                      'to change your password',
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            const CustomTextFormField(
              label: "Email",
              hintText: "example@gmail.com",
            ),
            const SizedBox(height: 10),
            CustomLargeButton(title: 'Send Code', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
