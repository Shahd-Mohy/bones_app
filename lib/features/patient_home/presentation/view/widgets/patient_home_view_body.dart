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

class PatientHomeViewBody extends StatefulWidget {
  const PatientHomeViewBody({super.key});

  @override
  State<PatientHomeViewBody> createState() => _PatientHomeViewBodyState();
}

class _PatientHomeViewBodyState extends State<PatientHomeViewBody> {
  late final ImageUploadService imageUploadService;

  @override
  void initState() {
    super.initState();
    imageUploadService = ImageUploadService(dio: Dio());
  }

  String? selectedBodyPart;
  final List<String> bodyParts = [
    'Hand',
    'Shoulder',
    'Finger',
    'Elbow',
    'Humerus',
    'Forearm',
    'Wrist',
  ];

  File? selectedImage;
  String? uploadedImageId;
  bool isUploading = false;
  bool hasUploadedNotViewed = false;

  Future<void> _pickImage() async {
    if (isUploading) return;

    try {
      final result = await FilePicker.platform.pickFiles();

      // 👇 User cancelled picking
      if (result == null || result.files.single.path == null) {
        return;
      }

      final imageFile = File(result.files.single.path!);

      // 👇 Only after valid image, start loading
      setState(() {
        selectedImage = imageFile;
        isUploading = true;
      });

      final userId = await SharedPrefsHelper.getUserId();
      if (userId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Center(
              child: Text('User ID not found. Please log in again.'),
            ),
            backgroundColor: Colors.red,
          ),
        );
        setState(() {
          isUploading = false;
        });
        return;
      }

      final response = await imageUploadService.uploadImage(
        imageFile: imageFile,
        userId: userId,
        bodyPart: selectedBodyPart ?? "",
      );

      if (response.statusCode == 200) {
        final result = response.data["data"][0]["data"];
        final imageId = result["id"];
        debugPrint("Upload complete! Image ID: $imageId");

        setState(() {
          uploadedImageId = imageId;
          hasUploadedNotViewed = true;
          isUploading = false;
        });

        await GoRouter.of(context).push(
          AppRouter.kReportGeneratingView,
          extra: imageId,
        );

        // 👇 Reset view state after coming back
        setState(() {
          hasUploadedNotViewed = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(
              child: Text(
                'Upload failed: ${response.data["message"] ?? response.statusMessage}',
              ),
            ),
            backgroundColor: Colors.red,
          ),
        );
        setState(() {
          isUploading = false;
        });
      }
    } catch (e) {
      debugPrint('File picker or upload error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(child: Text('Something went wrong while uploading.')),
          backgroundColor: Colors.red,
        ),
      );
      setState(() {
        isUploading = false;
      });
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
                  onTap: isUploading ? () {} : _pickImage,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    const Icon(Clarity.camera_solid,
                        size: 30, color: kSecondaryColor),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                    CustomMidButton(
                      title: "Upload Image",
                      onPressed: isUploading ? () {} : () => _pickImage(),
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
                              selectedBodyPart = value;
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
                      onPressed: () =>
                          GoRouter.of(context).push(AppRouter.kProfileView),
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
                      onPressed: () => GoRouter.of(context)
                          .push(AppRouter.kConsultationView),
                    ),
                  ],
                ),
                const Spacer(),
                CustomMidButton(
                  color: isUploading ? Colors.grey : kSecondaryColor,
                  title: isUploading ? "Loading..." : "View Report",
                  width: 348,
                  onPressed: isUploading || uploadedImageId == null
                      ? () {}
                      : () async {
                          await GoRouter.of(context).push(
                            AppRouter.kReportGeneratingView,
                            extra: uploadedImageId,
                          );
                          setState(() {
                            hasUploadedNotViewed = false;
                          });
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
