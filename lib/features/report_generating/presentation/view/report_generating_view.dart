import 'package:bones_app/core/cubits/cubit/image_report_cubit.dart';
import 'package:bones_app/core/networking/get_report_service.dart';
import 'package:bones_app/features/report_generating/presentation/view/widgets/report_generating_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bones_app/core/networking/dio_client.dart';

class ReportGeneratingView extends StatelessWidget {
  final String imageId;

  const ReportGeneratingView({super.key, required this.imageId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ImageReportCubit(ImageReportService(DioClient.createDio()))
        ..fetchReport(imageId),
      child: const Scaffold(
        body: ReportGeneratingViewBody(),
      ),
    );
  }
}
