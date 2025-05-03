import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/features/consultation/presentation/view/widgets/custom_message_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpecialistListItem extends StatelessWidget {
  final String name;
  final String email;

  const SpecialistListItem({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final width = double.infinity;
    final heigth = MediaQuery.of(context).size.height * 0.15;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Container(
            width: width,
            height: heigth,
            padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 5),
            decoration: const BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/Frame 2.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        email,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          CustomMessageButton(
            title: "Message",
            onPressed: () => GoRouter.of(context).push(AppRouter.kChatView),
          ),
          Divider(
              color: Colors.grey[300],
              thickness: 1,
              height: 15,
              indent: 10,
              endIndent: 20)
        ],
      ),
    );
  }
}
