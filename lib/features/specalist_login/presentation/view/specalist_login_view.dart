import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/specalist_login/data/repos/specialist_login_repo_imp.dart';
import 'package:bones_app/features/specalist_login/presentation/view/widgets/specalist_login_view_body.dart';
import 'package:bones_app/features/specalist_login/presentation/view_model/cubit/specialist_login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecalistLoginView extends StatelessWidget {
  const SpecalistLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: const Text(
          "Specalist Login",
          style: Styles.textStyle20,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => SpecialistLoginCubit(
            specialistLoginRepo: SpecialistLoginRepoImp(
          dio: Dio(),
        )),
        child: const SpecalistLoginViewBody(),
      ),
    );
  }
}
