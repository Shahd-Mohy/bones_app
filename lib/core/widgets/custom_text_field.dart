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
    required this.label,
  });

  final String label;
  final String hintText;
  final Icon? preIcon;
  final Icon? sufIcon;
  final bool isobsecureText;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 5),
          TextFormField(
            obscureText: isobsecureText,
            validator: (data) {
              if (data!.isEmpty) {
                return "Field is required!";
              }
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: kTextFieldColor,
              hintText: hintText,
              hintStyle: Styles.notesTextStyle.copyWith(
                color: Colors.grey,
              ),
              prefixIcon: imagePath != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 12, right: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            imagePath!,
                            width: 47,
                            height: 20,
                          ),
                          const SizedBox(width: 50),
                        ],
                      ),
                    )
                  : preIcon,
              suffixIcon: sufIcon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: kSecondaryColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
