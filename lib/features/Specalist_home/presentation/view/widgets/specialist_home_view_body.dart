import 'package:bones_app/core/utils/assets.dart';
import 'package:bones_app/core/widgets/custom_mid_button.dart';
import 'package:bones_app/core/widgets/home_image.dart';
import 'package:bones_app/core/widgets/upload_image_box.dart';
import 'package:flutter/material.dart';

class SpecialistHomeViewBody extends StatelessWidget {
  const SpecialistHomeViewBody({super.key});

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
      child: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Spacer(),
                  HomeImage(image: AssetsData.uploadImage),
                  SizedBox(
                    width: 15,
                  ),
                  CustomMidButton(title: "Upload Image"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  CustomMidButton(title: "Retrive Image"),
                  SizedBox(
                    width: 15,
                  ),
                  HomeImage(image: AssetsData.retrieveImage),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Spacer(),
                  HomeImage(image: AssetsData.feedbackImage),
                  SizedBox(
                    width: 15,
                  ),
                  CustomMidButton(title: "Give feedBack"),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              UploadImageBox(),
              SizedBox(
                height: 20,
              ),
              CustomMidButton(
                title: "Next",
                width: 348,
              )
            ],
          ),
        ),
      ),
    );
  }
}
