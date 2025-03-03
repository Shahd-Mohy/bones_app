import 'package:bones_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 5, bottom: 10),
      child: SizedBox(
        height: 56,
        width: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(
                  Icons.sort_rounded,
                  color: Colors.black,
                  size: 35,
                ),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                AssetsData.appBarLogo,
                height: 50,
                width: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
