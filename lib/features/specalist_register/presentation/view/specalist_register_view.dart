import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/specalist_register/data/repos/specialist_register_repo_imp.dart';
import 'package:bones_app/features/specalist_register/presentation/view/widgets/specalist_register_view_body.dart';
import 'package:bones_app/features/specalist_register/presentation/view_model/cubit/specialist_register_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecalistRegisterView extends StatelessWidget {
  const SpecalistRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: const Text(
            "Sign Up",
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
        body: BlocProvider(
          create: (context) => SpecialistRegisterCubit(
            specialistRegisterRepo: SpecialistRegisterRepoImp(dio: Dio()),
          ),
          child: const SpecalistRegisterViewBody(),
        ));
  }
}
