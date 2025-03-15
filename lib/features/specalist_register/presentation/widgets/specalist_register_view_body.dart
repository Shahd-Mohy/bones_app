import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/widgets/custom_large_button.dart';
import 'package:bones_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpecalistRegisterViewBody extends StatelessWidget {
  const SpecalistRegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextFormField(
              label: "Full Name",
              hintText: "Enter your name",
            ),
            const CustomTextFormField(
              label: "Email or Phone",
              hintText: "example@gmail.com",
            ),
            const CustomTextFormField(
              label: "Password",
              hintText: "Enter your password",
            ),
            const CustomTextFormField(
              label: "Confirm Password",
              hintText: "Confirm your password here",
            ),
// Willlll be edited soon ///////////////////////////////////////////////////////////////////////
            const CustomTextFormField(
              label: "Certefication",
              hintText: "Attach your certification here",
            ),
            const SizedBox(
              height: 40,
            ),
            CustomLargeButton(
                title: "Sign Up",
                onPressed: () =>
                    GoRouter.of(context).push(AppRouter.kPaymentView)),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account ? ",
                      style:
                          Styles.notesTextStyle.copyWith(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () => GoRouter.of(context)
                          .push(AppRouter.kPatientLoginView),
                      child: Text(
                        "Login now!",
                        style:
                            Styles.notesTextStyle.copyWith(color: kNotesColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
