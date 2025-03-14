import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/assets.dart';
import 'package:bones_app/core/widgets/custom_mid_button.dart';
import 'package:bones_app/core/widgets/home_image.dart';
import 'package:bones_app/core/widgets/upload_image_box.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PatientHomeViewBody extends StatelessWidget {
  const PatientHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetsData.backGround1),
            fit: BoxFit.cover,
            opacity: 0.8),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  const HomeImage(image: AssetsData.uploadImage),
                  const SizedBox(
                    width: 15,
                  ),
                  CustomMidButton(
                    title: "Upload Image",
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  CustomMidButton(
                    title: "Retrive Image",
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const HomeImage(image: AssetsData.retrieveImage),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Spacer(),
                  const HomeImage(image: AssetsData.consultSpisialist),
                  const SizedBox(
                    width: 15,
                  ),
                  CustomMidButton(
                    title: "Consult a Specialist",
                    onPressed: () =>
                        GoRouter.of(context).push(AppRouter.kConsultationView),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const UploadImageBox(),
              const SizedBox(
                height: 20,
              ),
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
