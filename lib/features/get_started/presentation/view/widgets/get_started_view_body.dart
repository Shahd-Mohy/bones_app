import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/assets.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/widgets/custom_mid_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetStartedViewBody extends StatelessWidget {
  const GetStartedViewBody({super.key, required this.userType});
  final String userType;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 10),
                      Image.asset(AssetsData.logo),
                      const Text("Let’s get started!",
                          style: Styles.textStyle20),
                      SizedBox(height: height * 0.02), // Responsive spacing
                      Text(
                        "Login to enjoy the features we’ve \nprovided, and stay healthy!",
                        textAlign: TextAlign.center,
                        style: Styles.textStyle14
                            .copyWith(color: kIconSoftGreyColor),
                      ),
                      SizedBox(height: height * 0.05), // Responsive spacing
                      CustomMidButton(
                          title: "Login",
                          onPressed: () {
                            if (userType == "Doctor") {
                              GoRouter.of(context)
                                  .push(AppRouter.kSpecalistLoginView);
                            } else {
                              GoRouter.of(context)
                                  .push(AppRouter.kPatientLoginView);
                            }
                          }),
                      SizedBox(height: height * 0.02), // Responsive spacing
                      CustomMidButton(
                        color: kPrimaryColor,
                        title: "Sign Up",
                        onPressed: () {
                            if (userType == "Doctor") {
                              GoRouter.of(context)
                                  .push(AppRouter.kSpecalistRegisterView);
                            } else {
                              GoRouter.of(context)
                                  .push(AppRouter.kPatientRegisterView);
                            }
                          }
                      ),
                      const Spacer(flex: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
