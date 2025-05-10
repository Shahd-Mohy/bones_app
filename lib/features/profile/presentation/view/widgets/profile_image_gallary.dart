import 'package:bones_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ProfileImageGallery extends StatelessWidget {
  const ProfileImageGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> uploadedImages = [
      AssetsData.userImage,
      AssetsData.userImage,
      AssetsData.userImage,
      AssetsData.userImage,
      AssetsData.userImage,
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: uploadedImages.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Image.asset(
              uploadedImages[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
