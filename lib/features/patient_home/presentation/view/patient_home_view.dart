import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/assets.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/patient_home/presentation/view/widgets/patient_home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: const Text(
            "Patient Home",
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kProfileView);
                },
                child: CircleAvatar(
                  maxRadius: 18,
                  child: Image.asset(AssetsData.userImage),
                  //backgroundImage: const
                  backgroundColor: kSecondaryColor.withOpacity(0.2),
                ),
              ),
            ),
          ],
        ),
        body: const PatientHomeViewBody());
  }
}
