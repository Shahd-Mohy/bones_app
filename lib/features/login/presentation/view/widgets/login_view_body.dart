import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/assets.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 280,
                    width: 233,
                    child: Image.asset(AssetsData.logo),
                  ),
                ],
              ),
              const CustomTextFormField(
                hintText: "Username or Email",
                preIcon: Icon(Icons.person, color: kIconColor),
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomTextFormField(
                hintText: "Password",
                preIcon: Icon(
                  Icons.lock,
                  color: kIconColor,
                ),
                sufIcon: Icon(Icons.remove_red_eye),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Text(
                      "Forgot Password ?",
                      style: Styles.hintTextStyle.copyWith(color: kNotesColor),
                    ),
                    onTap: () => GoRouter.of(context)
                        .push(AppRouter.kForgetPasswordView),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomLargeButton(
                  title: 'Login ',
                  onPressed: () =>
                      GoRouter.of(context).push(AppRouter.kGetStartedView)),
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
                        style:
                            Styles.hintTextStyle.copyWith(color: Colors.black),
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
      ),
    );
  }
}
