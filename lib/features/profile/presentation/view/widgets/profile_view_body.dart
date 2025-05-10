import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/assets.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/profile/presentation/view/widgets/profile_image_gallary.dart';
import 'package:bones_app/features/profile/presentation/view/widgets/profile_info_card.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: kSecondaryColor.withOpacity(0.2),
            maxRadius: 60,
            child: Image.asset(
              AssetsData.userImage,
              fit: BoxFit.cover,
              width: 65,
              height: 65,
            ),
          ),
          const SizedBox(height: 16),
          Divider(
            thickness: 1.2,
            color: Colors.grey.shade300,
            indent: screenWidth * 0.1,
            endIndent: screenWidth * 0.1,
          ),
          const SizedBox(height: 24),
          const ProfileInfoCard(
            icon: Icons.person_outline,
            title: 'Name',
            value: 'John Doe',
          ),
          const SizedBox(height: 16),
          const ProfileInfoCard(
            icon: Icons.email_outlined,
            title: 'Email',
            value: 'johndoe@example.com',
          ),
          const SizedBox(height: 16),
          const ProfileInfoCard(
            icon: Icons.phone_outlined,
            title: 'Phone',
            value: '+1 234 567 890',
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Uploaded Images",
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12),
          const ProfileImageGallery(),
        ],
      ),
    );
  }
}
