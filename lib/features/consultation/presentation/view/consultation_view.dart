import 'package:bones_app/constants.dart';
import 'package:bones_app/core/networking/api_services.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/consultation/data/repos/specialist_repo.dart';
import 'package:bones_app/features/consultation/presentation/view/widgets/consultation_view_body.dart';
import 'package:bones_app/features/consultation/presentation/view_model/cubit/specialist_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsultationView extends StatelessWidget {
  const ConsultationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpecialistCubit(SpecialistRepo(ApiService(Dio())))
        ..fetchAllSpecialists(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: const Text(
            "Consultation",
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
        body: const ConsultationViewBody(),
      ),
    );
  }
}
