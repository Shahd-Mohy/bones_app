import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PaymentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final AssetImage image;

  const PaymentCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        //color: kPrimaryColor,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(12),
        // ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryColor,
          border: Border.all(
            color:
                kSecondaryColor.withOpacity(0.45), // Set the border color here
            width: 1.5, // Set the border width
          ),
        ),
        child: ListTile(
          leading: SizedBox(
              height: height * 0.18,
              width: width * 0.18,
              child: Image(
                image: image,
                fit: BoxFit.contain,
              )),
          title: Text(title, style: Styles.notesTextStyle),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
      ),
    );
  }
}
