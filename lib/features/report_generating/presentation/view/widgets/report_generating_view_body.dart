import 'package:bones_app/core/cubits/cubit/image_report_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ReportGeneratingViewBody extends StatelessWidget {
  const ReportGeneratingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageReportCubit, ImageReportState>(
      builder: (context, state) {
        if (state is ImageReportLoading) {
          return Center(
            child: Lottie.asset(
              'assets/animations/bone_loading.json',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.contain,
            ),
          );
        } else if (state is ImageReportLoaded) {
          final report = state.report;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            '🦴 Bone Analysis Report',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey[900],
                                ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        headerOfReport("🔍 Details"),
                        displayedResultPart(
                            "📍 Body Part", report.data.bodyPart),
                        displayedResultPart(
                            "💡 Prediction", report.data.prediction),
                        displayedResultPart("✅ Confidence",
                            "${report.data.confidence.toStringAsFixed(2)}%"),
                        displayedResultPart("🩻 Fracture Confidence",
                            "${report.data.fractureConfidence.toStringAsFixed(2)}%"),
                        displayedResultPart("📊 State", report.data.status),
                        displayedResultPart(
                            "⏱ Received", report.data.receivedTime.toString()),
                        if (report.data.error.isNotEmpty) ...[
                          const SizedBox(height: 16),
                          headerOfReport("⚠️ Error"),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.redAccent),
                            ),
                            child: Text(
                              report.data.error,
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (state is ImageReportError) {
          return Center(
            child: Text(
              "Error: ${state.message}",
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else {
          return const Center(
            child: Text("No report fetched yet."),
          );
        }
      },
    );
  }

  Widget displayedResultPart(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label:",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget headerOfReport(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 6),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
