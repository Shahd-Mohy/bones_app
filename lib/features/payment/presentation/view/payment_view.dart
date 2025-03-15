import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/assets.dart';
import 'package:bones_app/features/payment/presentation/view/widgets/payment_view_body.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kTextFieldColor,
                image: DecorationImage(
                    image: AssetImage(AssetsData.userImage),
                    fit: BoxFit.contain)),
            height: 100,
            width: 100,
          ),
        ),
      ),
      body: const PaymentViewBody(),
    );
  }
}
