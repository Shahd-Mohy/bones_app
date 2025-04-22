import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/report_generating/presentation/view/widgets/report_generating_box.dart';
import 'package:flutter/material.dart';

class ReportGeneratingViewBody extends StatelessWidget {
  const ReportGeneratingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              "Hold on for a second! ",
              style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 40,
            ),
            const ReportGeneratingContainer()
          ],
        ),
      ),
    );
  }
}
