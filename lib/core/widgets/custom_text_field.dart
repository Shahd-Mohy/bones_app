import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.preIcon,
    this.sufIcon,
    this.isobsecureText = false,
    this.imagePath,
  });
  final String hintText;
  final Icon? preIcon;
  final Icon? sufIcon;
  final bool isobsecureText;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isobsecureText,
      validator: (data) {
        if (data!.isEmpty) {
          return "Field is required!";
        }
      },
      decoration: InputDecoration(
          hintStyle: Styles.hintTextStyle,
          filled: true,
          fillColor: kTextFieldColor,
          hintText: hintText,
          prefixIcon: imagePath != null
              ? Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 10), 
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        imagePath!,
                        width: 47,
                        height: 20,
                      ),
                      const SizedBox(
                          width: 50), // Add space between image and text
                    ],
                  ),
                )
              : preIcon,
          suffixIcon: sufIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: kTextFieldColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xff3265D2)),
          )),
    );
  }
}
