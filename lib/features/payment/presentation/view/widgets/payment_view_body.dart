import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/assets.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/payment/presentation/view/widgets/payment_card.dart';
import 'package:flutter/material.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Payment",
              style: Styles.textStyle25.copyWith(color: kSecondaryColor)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const PaymentCard(
            title: 'Visa',
            subtitle: '**** 5645',
            image: AssetImage(AssetsData.visa),
          ),
          const PaymentCard(
            title: 'PayPal',
            subtitle: '**** 5645',
            image: AssetImage(AssetsData.payPal),
          ),
          const PaymentCard(
            title: 'Master Card',
            subtitle: '**** 6356',
            image: AssetImage(AssetsData.masterCard),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Add Payment Method!",
              style: Styles.textStyle16.copyWith(
                  color: kSecondaryColor, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
