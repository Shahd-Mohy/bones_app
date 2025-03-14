import 'package:bones_app/features/report_generating/presentation/view/widgets/report_generating_view_body.dart';
import 'package:flutter/material.dart';

class ReportGeneratingView extends StatelessWidget {
  const ReportGeneratingView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(title: const Text("Report Generating PAge"),),body: const ReportGeneratingViewBody());
  }
}
