import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/widgets/custom_large_button.dart';
import 'package:bones_app/features/forget_password/presentation/view/widgets/custom_number_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CodeVerificationView extends StatelessWidget {
  const CodeVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: const Text(
            "Forgrt Password",
            style: Styles.textStyle20,
          ),
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: const CodeVerificationBody());
  }
}

class CodeVerificationBody extends StatelessWidget {
  const CodeVerificationBody({super.key});

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
                      'Password will be set in minutes',
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Enter the code you recieved, Please',
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomNumberTextField(),
                  CustomNumberTextField(),
                  CustomNumberTextField(),
                  CustomNumberTextField(),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Resend Code!",
                  style: Styles.notesTextStyle.copyWith(
                      decoration: TextDecoration.underline,
                      color: kIconSoftGreyColor),
                )
              ],
            ),
            const SizedBox(height: 15),
            CustomLargeButton(title: 'verify', onPressed: () => GoRouter.of(context).push(AppRouter.kResetPasswordView)),
          ],
        ),
      ),
    );
  }
}
