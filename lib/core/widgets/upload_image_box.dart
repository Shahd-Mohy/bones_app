import 'dart:io';
import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class UploadImageBox extends StatelessWidget {
  final File? selectedImage;
  final VoidCallback onTap;

  const UploadImageBox({
    super.key,
    required this.selectedImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          color: const Color(0xffF1F1F1),
          border: Border.all(
            color: kSecondaryColor,
            width: 1,
          ),
        ),
        child: selectedImage != null
            ? ClipRRect(
                child: SizedBox.expand(
                  child: Image.file(
                    selectedImage!,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetsData.imageIcon,
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Tap to upload image",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
      ),
    );
  }
}
