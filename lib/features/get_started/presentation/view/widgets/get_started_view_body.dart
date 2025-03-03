import 'package:bones_app/core/widgets/custom_mini_button.dart';
import 'package:flutter/material.dart';

class GetStartedViewBody extends StatelessWidget {
  const GetStartedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/skeleton 1.png",
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
          opacity: const AlwaysStoppedAnimation(0.9),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomMiniButton(title: "Paitent", onPressed: () {}),
             const SizedBox(width: 30),
              CustomMiniButton(title: "Spicalist", onPressed: () {}),
            ],
          ),
        ),
        const SizedBox(height: 50),
      ],
    ));
  }
}
