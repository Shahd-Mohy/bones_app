import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/widgets/contacts.dart';
import 'package:bones_app/core/widgets/custom_large_button.dart';
import 'package:bones_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 45,
            ),
            const Center(
              child: Text(
                'Create an account!',
                style: Styles.textStyle25,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const CustomTextFormField(
              hintText: "Full name",
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextFormField(
              hintText: "Email",
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextFormField(
              hintText: "Password",
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextFormField(
              hintText: "Confirm Password",
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
            const Contacts(),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: SizedBox(
                height: 30,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don`t have an account ? ",
                      style: Styles.hintTextStyle.copyWith(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () =>
                          GoRouter.of(context).push(AppRouter.kLoginView),
                      child: Text(
                        "Login now!",
                        style:
                            Styles.hintTextStyle.copyWith(color: kNotesColor),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
