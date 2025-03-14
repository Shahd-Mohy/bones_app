import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/assets.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/welcome/presentation/view/widgets/custom_welcome_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 4,
            ),
            Text("Welcome To Our App",
                style: Styles.textStyle20.copyWith(color: kSecondaryColor)),
            const Spacer(
              flex: 1,
            ),
            Text("SELECT YOUR SECTION",
                style: Styles.textStyle16.copyWith(
                    color: kSecondaryColor, fontWeight: FontWeight.w500)),
            const Spacer(
              flex: 4,
            ),
            CustomWelcomeImage(
                title: "Patient",
                imagePath: AssetsData.hospitalPatientImage,
                onPressed: () =>
                    GoRouter.of(context).push(AppRouter.kGetStartedView)),
            const Spacer(
              flex: 4,
            ),
            CustomWelcomeImage(
                title: "Doctor",
                imagePath: AssetsData.doctorImage,
                onPressed: () =>
                    GoRouter.of(context).push(AppRouter.kGetStartedView)),
            const Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
