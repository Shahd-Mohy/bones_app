import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/assets.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/Specalist_home/presentation/view/widgets/specialist_home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SpecialistHomeView extends StatelessWidget {
  const SpecialistHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: const Text(
          "Specalist Home",
          style: Styles.textStyle20,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kProfileView);
              },
              child: CircleAvatar(
                radius: 18,
                backgroundImage: const AssetImage(AssetsData.userImage),
                backgroundColor: kSecondaryColor.withOpacity(0.2),
              ),
            ),
          ),
        ],
      ),
      body: const SpecialistHomeViewBody(),
    );
  }
}
