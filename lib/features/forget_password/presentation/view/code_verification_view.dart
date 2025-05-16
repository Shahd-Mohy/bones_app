import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/forget_password/presentation/view/widgets/code_verification_view_body.dart';
import 'package:flutter/material.dart';

class CodeVerificationView extends StatelessWidget {
  final String email;
  const CodeVerificationView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: const Text("Forget Password", style: Styles.textStyle20),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: CodeVerificationBody(email: email),
    );
  }
}
