import 'package:bones_app/core/widgets/custom_app_bar.dart';
import 'package:bones_app/features/report_generating/presentation/view/widgets/report_generating_view_body.dart';
import 'package:flutter/material.dart';

class ReportGeneratingView extends StatelessWidget {
  const ReportGeneratingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        CustomAppBar(),
        SizedBox(height: 40),
        ReportGeneratingViewBody()
      ],
    ));
  }
}
