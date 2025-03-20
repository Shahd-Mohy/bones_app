import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class UploadImageBox extends StatelessWidget {
  const UploadImageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color:const Color(0xffF1F1F1),
        border: Border.all(
          color: kSecondaryColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.55,
            //height: 46,
            child: Center(child: Image.asset(AssetsData.imageIcon)),
          ),
          const SizedBox(width: 10),
          
        ],
      ),
    );
  }
}
