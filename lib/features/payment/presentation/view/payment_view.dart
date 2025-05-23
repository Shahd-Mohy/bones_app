import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/payment/presentation/view/widgets/payment_view_body.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "💳 Complete Your Payment",
          style: Styles.notesTextStyle,
        ),
        centerTitle: true,
      ),
      body: const PaymentViewBody(),
    );
  }
}
