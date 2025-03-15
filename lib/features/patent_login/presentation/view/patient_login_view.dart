import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/patent_login/presentation/view/widgets/patient_login_view_body.dart';
import 'package:flutter/material.dart';

class PatientLoginView extends StatelessWidget {
  const PatientLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: const Text(
          "Login",
          style: Styles.textStyle20,
        ),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: const PatientLoginViewBody(),
    );
  }
}
