import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/widgets/contacts.dart';
import 'package:bones_app/core/widgets/custom_large_button.dart';
import 'package:bones_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CheckboxTheme(
                  data: CheckboxThemeData(
                    side: const BorderSide(width: 0.5, color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Checkbox(
                    value: false, // Add state management for this
                    onChanged: (value) {},
                  ),
                ),
                Text(
                  "Remember me",
                  style: Styles.notesTextStyle.copyWith(color: Colors.black),
                ),
              ],
            ),
            const CustomTextFormField(
              label: "Email or Phone",
              hintText: "example@gmail.com..",
            ),
            // SizedBox(height: height * 0.02),
            const CustomTextFormField(
              label: "Password",
              hintText: "Enter your password..",
              isobsecureText: true,
              sufIcon: Icon(Icons.remove_red_eye),
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Text(
                    "Forgot Password ?",
                    style: Styles.notesTextStyle.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () =>
                      GoRouter.of(context).push(AppRouter.kForgetPasswordView),
                ),
              ],
            ),
            SizedBox(height: height * 0.19),
            CustomLargeButton(
              title: "Login",
              onPressed: () =>
                  GoRouter.of(context).push(AppRouter.kPatientHomeView),
            ),
            SizedBox(height: height * 0.03),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account? ",
                    style: Styles.notesTextStyle.copyWith(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () =>
                        GoRouter.of(context).push(AppRouter.kRegisterView),
                    child: Text(
                      "Sign Up!",
                      style: Styles.notesTextStyle.copyWith(color: kNotesColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            const Contacts(),
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
    );
  }
}
