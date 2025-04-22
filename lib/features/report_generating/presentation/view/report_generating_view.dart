import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/report_generating/presentation/view/widgets/report_generating_view_body.dart';
import 'package:flutter/material.dart';

class ReportGeneratingView extends StatelessWidget {
  const ReportGeneratingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: const Text(
            "Report Generating",
            style: Styles.textStyle20,
          ),
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: const ReportGeneratingViewBody());
  }
}
