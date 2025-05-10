import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfileInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade50,
      ),
      child: Row(
        children: [
          Icon(icon, color: kSecondaryColor, size: 28),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Styles.textStyle14.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 4),
              Text(value, style: Styles.textStyle16),
            ],
          ),
        ],
      ),
    );
  }
}
