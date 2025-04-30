import 'dart:io';

import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/widgets/custom_mid_button.dart';
import 'package:bones_app/core/widgets/upload_image_box.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class SpecialistHomeViewBody extends StatefulWidget {
  const SpecialistHomeViewBody({super.key});

  @override
  State<SpecialistHomeViewBody> createState() => _SpecialistHomeViewBodyState();
}

class _SpecialistHomeViewBodyState extends State<SpecialistHomeViewBody> {
  File? selectedImage;
  bool ispicking = false;
  void _pickImage() async {
    if (ispicking) return;
    ispicking = true;

    try {
      final result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.path != null) {
        setState(() {
          selectedImage = File(result.files.single.path!);
        });
      }
    } catch (e) {
      debugPrint('File picker error: $e');
    } finally {
      ispicking = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: Center(
            child: Column(
              children: [
                UploadImageBox(
                  selectedImage: selectedImage,
                  onTap: _pickImage,
                ),
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
                      onPressed: _pickImage,
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
                      Icons.feedback_outlined,
                      size: 30,
                      color: kSecondaryColor,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                    CustomMidButton(
                      title: "Give FeedBack",
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
      ),
    );
  }
}
