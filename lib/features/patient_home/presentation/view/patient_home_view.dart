import 'package:bones_app/features/patient_home/presentation/view/widgets/patient_home_view_body.dart';
import 'package:flutter/material.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [SizedBox(height: 40), PatientHomeViewBody()],
    ));
  }
}
