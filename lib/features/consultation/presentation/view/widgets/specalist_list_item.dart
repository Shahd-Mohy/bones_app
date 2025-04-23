import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpecialistListItem extends StatelessWidget {
  const SpecialistListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: double.infinity,
        height: 125,
        padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 5),
        decoration: BoxDecoration(
          color: kDrItemColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: kIconSoftGreyColor.withOpacity(0.4),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage(AssetsData.userImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 14), // Space between image and text

            // Text Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  const Text(
                    "Dr. User",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    "123 A Street xx xxx xx",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    "0123456789",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    "User@gmail.com",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),

            // Chat Icon
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 55,
                height: 55,
                decoration: const BoxDecoration(
                  color: kIconSoftGreyColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () => GoRouter.of(context).push(AppRouter.kChatView),
                    child: const Icon(
                      Icons.chat_bubble_outline_rounded,
                      size: 40, // Exact size
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
