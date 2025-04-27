import 'package:bones_app/constants.dart';
import 'package:bones_app/core/networking/api_services.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/patient_register/data/repos/patient_register_repo_imp.dart';
import 'package:bones_app/features/patient_register/presentation/view/widgets/patient_register_view_body.dart';
import 'package:bones_app/features/patient_register/presentation/view_model/cubit/patient_register_cubit.dart';
import 'package:dio/dio.dart'; // <-- You need to import Dio!
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientRegisterView extends StatelessWidget {
  const PatientRegisterView({super.key});

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
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => PatientRegisterCubit(
          patientRegisterRepo: PatientRegisterRepoImp(ApiService(Dio())),
        ),
        child: const PatientRegisterViewBody(),
      ),
    );
  }
}
