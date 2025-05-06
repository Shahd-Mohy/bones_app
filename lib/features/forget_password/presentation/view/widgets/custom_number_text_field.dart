import 'package:flutter/material.dart';
import 'package:bones_app/constants.dart';

class CustomNumberTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final FocusNode? previousFocusNode;

  const CustomNumberTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
    this.previousFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: MediaQuery.of(context).size.width * 0.18,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(fontSize: 20),
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: kTextFieldColor),
          ),
          filled: true,
          fillColor: kTextFieldColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: kSecondaryColor),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            nextFocusNode?.requestFocus();
          } else if (value.isEmpty) {
            previousFocusNode?.requestFocus();
          }
        },
      ),
    );
  }
}
