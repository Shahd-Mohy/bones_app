import 'package:bones_app/constants.dart';
import 'package:flutter/material.dart';

class ReportGeneratingContainer extends StatelessWidget {
  const ReportGeneratingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 359,
      height: 400,
      decoration: BoxDecoration(
        color: kUploadImageBoxColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: Offset(4, 4),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            offset: Offset(-4, -4),
            blurRadius: 10,
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.7),
          width: 2,
        ),
      ),
    );
  }
}
