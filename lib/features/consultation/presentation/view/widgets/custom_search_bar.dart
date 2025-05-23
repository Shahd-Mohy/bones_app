import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const CustomSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: kIconSoftGreyColor.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 64,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kSecondaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: kSecondaryColor),
            ),
            hintText: 'Search for a Specialist.... ',
            hintStyle: Styles.notesTextStyle,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mic_none, color: kIconSoftGreyColor),
            ),
            prefixIcon: IconButton(
              onPressed: () {},
              icon: const Opacity(
                opacity: 0.8,
                child: Icon(
                  Icons.search_rounded,
                  color: kIconSoftGreyColor,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
