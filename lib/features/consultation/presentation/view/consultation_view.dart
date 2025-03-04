import 'package:bones_app/core/widgets/custom_app_bar.dart';
import 'package:bones_app/features/consultation/presentation/view/widgets/consultation_view_body.dart';
import 'package:flutter/material.dart';

class ConsultationView extends StatelessWidget {
  const ConsultationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [CustomAppBar(), ConsultationViewBody()],
    ));
  }
}
