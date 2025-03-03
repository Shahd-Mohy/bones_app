import 'package:bones_app/core/widgets/custom_app_bar.dart';
import 'package:bones_app/features/Specalist_home/presentation/view/widgets/specialist_home_view_body.dart';
import 'package:flutter/material.dart';

class SpecialistHomeView extends StatelessWidget {
  const SpecialistHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        CustomAppBar(),
        SizedBox(height: 40),
        SpecialistHomeViewBody()
      ],
    ));
  }
}
