import 'package:bones_app/core/utils/assets.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/widgets/custom_mini_button.dart';
import 'package:bones_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Payment",
                  style: Styles.textStyle20,
                  // style: Styles.textStyle16
                  //     .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            ),
          ),
          CustomTextFormField(
            hintText: "*********2109",
            imagePath: AssetsData.visa,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
              hintText: "*********2109", imagePath: AssetsData.payPal),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
              hintText: "*********2109", imagePath: AssetsData.masterCard),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
              hintText: "*********2109", imagePath: AssetsData.applePay),
          const SizedBox(
            height: 50,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomMiniButton(title: "Anual", onPressed: () {}),
              const SizedBox(width: 30),
              CustomMiniButton(title: "Monthly", onPressed: () {}),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("• ",
                style:
                    Styles.textStyle16.copyWith(fontWeight: FontWeight.bold)),
            Text("Try Twice for free",
                style: Styles.textStyle16.copyWith(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold)),
          ])
        ],
      ),
    ));
  }
}
