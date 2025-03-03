import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/assets.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class UploadImageBox extends StatelessWidget {
  const UploadImageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 359,
      height: 280,
      decoration: BoxDecoration(
        color: kUploadImageBoxColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: Offset(4, 4),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            offset: Offset(-4, -4),
            blurRadius: 10,
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.7),
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 48,
            height: 46,
            child: Image.asset(AssetsData.uploadIcon),
          ),
          const SizedBox(width: 10),
          Text(
            "Upload your image here",
            style: Styles.textStyle14.copyWith(color: kIconColor),
          ),
        ],
      ),
    );
  }
}
