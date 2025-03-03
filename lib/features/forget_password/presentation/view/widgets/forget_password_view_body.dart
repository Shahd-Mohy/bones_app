import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/widgets/contacts.dart';
import 'package:bones_app/core/widgets/custom_large_button.dart';
import 'package:bones_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 45,
            ),
            const Center(
              child: Text(
                'Forget Password ?',
                style: Styles.textStyle25,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const CustomTextFormField(
              hintText: "Enter your email",
              preIcon: Icon(
                Icons.person,
                color: kIconColor,
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            const Column(children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text("• ", style: Styles.textStyle14),
                  Text("Check your Email", style: Styles.textStyle14),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text("• ", style: Styles.textStyle14),
                  Text("Reset your password", style: Styles.textStyle14),
                ],
              ),
            ]),
            const SizedBox(
              height: 45,
            ),
            CustomLargeButton(title: 'Submit', onPressed: () {}),
            const SizedBox(
              height: 140,
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
                          GoRouter.of(context).push(AppRouter.kRegisterView),
                      child: Text(
                        "Register now!",
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
