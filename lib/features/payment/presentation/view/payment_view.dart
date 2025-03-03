import 'package:bones_app/core/widgets/custom_app_bar.dart';
import 'package:bones_app/features/payment/presentation/view/widgets/payment_view_body.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          PaymentViewBody()
        ],
      )
    );
  }
}
