import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/widgets/custom_mini_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GetStartedViewBody extends StatelessWidget {
  const GetStartedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/images/skeleton 1.png",
            fit: BoxFit.cover,
            opacity: const AlwaysStoppedAnimation(0.9),
          ),
        ),

        // Buttons - Wrapped in Column for proper layout
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomMiniButton(
                    title: "Patient",
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kPatientHomeView);
                    },
                  ),
                  const SizedBox(width: 30),
                  CustomMiniButton(
                    title: "Specialist",
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kSpecialistHomeView);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ],
    );
  }
}
