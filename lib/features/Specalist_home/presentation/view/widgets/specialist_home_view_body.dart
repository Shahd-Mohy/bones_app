import 'dart:io';

import 'package:bones_app/constants.dart';
import 'package:bones_app/core/networking/upload_image_service.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/shared_prefs_helper.dart';
import 'package:bones_app/core/widgets/custom_mid_button.dart';
import 'package:bones_app/core/widgets/upload_image_box.dart';
import 'package:dio/dio.dart';
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
  late final ImageUploadService imageUploadService;

  @override
  void initState() {
    super.initState();
    imageUploadService = ImageUploadService(dio: Dio());
  }

  String? selectedBodyPart;
  final List<String> bodyParts = [
    'Hand',
    'Arm',
    'Shoulder',
    'Finger',
    'Elbow',
    'Humerus',
    'Forearm',
    'Wrist',
  ];

  File? selectedImage;
  bool ispicking = false;
    void _pickImage() async {
    if (ispicking) return;
    ispicking = true;

    try {
      final result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.path != null) {
        final imageFile = File(result.files.single.path!);

        setState(() {
          selectedImage = imageFile;
        });

        final userId = await SharedPrefsHelper.getUserId();
        if (userId == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Center(
                  child: Text('User ID not found. Please log in again.')),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        if (selectedBodyPart == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Center(child: Text('Please select a body part.')),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        final response = await imageUploadService.uploadImage(
          imageFile: imageFile,
          userId: userId,
          bodyPart: selectedBodyPart!.toLowerCase(),
        );

        if (response.statusCode == 200) {
          final result = response.data["data"][0]["data"];
          debugPrint("Model result: $result");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(child: Text('Upload complete!\nStatus: ${result["status"]}')),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(
                child: Text(
                    'Upload failed: ${response.data["message"] ?? response.statusMessage}'),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('File picker or upload error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(child: Text('Something went wrong while uploading.')),
          backgroundColor: Colors.red,
        ),
      );
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kSecondaryColor),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: const Text("Choose a body part"),
                          value: selectedBodyPart,
                          items: bodyParts.map((part) {
                            return DropdownMenuItem<String>(
                              value: part,
                              child: Text(part),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedBodyPart = value!;
                            });
                          },
                        ),
                      ),
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
                      onPressed: () => GoRouter.of(context)
                          .push(AppRouter.kConsultationView),
                    ),
                  ],
                ),
                Spacer(),
                CustomMidButton(
                  title: "View Report",
                  width: 348,
                  onPressed: () {
                    if (selectedImage == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Center(
                              child:
                                  Text('You need to upload an image first.')),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    if (selectedBodyPart == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Center(child: Text('Please select a body part.')),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    GoRouter.of(context).push(AppRouter.kReportGeneratingView);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
