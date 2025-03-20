import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/Specalist_home/presentation/view/widgets/specialist_home_view_body.dart';
import 'package:flutter/material.dart';

class SpecialistHomeView extends StatelessWidget {
  const SpecialistHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: const Text(
            "Specalist Home",
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
        body: 
        const SpecialistHomeViewBody());
  }
}
