import 'package:bones_app/features/consultation/presentation/view/widgets/consultation_view_body.dart';
import 'package:flutter/material.dart';

class ConsultationView extends StatelessWidget {
  const ConsultationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultation'),
      ),
      body: const ConsultationViewBody(),
    );
  }
}
