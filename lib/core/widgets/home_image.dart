import 'package:flutter/material.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 59,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
