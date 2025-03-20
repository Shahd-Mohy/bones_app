import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/widgets/custom_mid_button.dart';
import 'package:bones_app/core/widgets/upload_image_box.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class PatientHomeViewBody extends StatelessWidget {
  const PatientHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Center(
          child: Column(
            children: [
              const UploadImageBox(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  const Icon(
                    Clarity.camera_solid,
                    size: 30,
                    color: kSecondaryColor,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                  CustomMidButton(
                    title: "Upload Image",
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                children: [
                  CustomMidButton(
                    title: "Retrive Image",
                    onPressed: () {},
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                  const Icon(
                    Clarity.backup_restore_solid,
                    size: 30,
                    color: kSecondaryColor,
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                children: [
                  const Spacer(),
                  const Icon(
                    FontAwesome.stethoscope_solid,
                    size: 30,
                    color: kSecondaryColor,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                  CustomMidButton(
                    title: "Consult a Specialist",
                    onPressed: () =>
                        GoRouter.of(context).push(AppRouter.kConsultationView),
                  ),
                ],
              ),
              Spacer(),
              CustomMidButton(
                title: "Next",
                width: 348,
                onPressed: () =>
                    GoRouter.of(context).push(AppRouter.kReportGeneratingView),
              )
            ],
          ),
        ),
      ),
    );
  }
}
