import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BonesApp());
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
          textTheme:
              GoogleFonts.interTextTheme(ThemeData.light().textTheme)),
    );
  }
}
