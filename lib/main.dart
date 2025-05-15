import 'package:bones_app/constants.dart';
import 'package:bones_app/core/cubits/cubit/image_report_cubit.dart';
import 'package:bones_app/core/networking/get_report_service.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
    BlocProvider(
      create: (_) => ImageReportCubit(ImageReportService(Dio())),
    ),
  ],
    child: const BonesApp(),
  ));
}

class BonesApp extends StatelessWidget {
  const BonesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme)),
    );
  }
}
