import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/networking/api_services.dart';
import 'package:bones_app/core/networking/dio_client.dart';
import 'package:bones_app/features/forget_password/data/repos/forget_password_repo_impl.dart';
import 'package:bones_app/features/forget_password/presentation/view/widgets/forget_password_view_body.dart';
import 'package:bones_app/features/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgetPasswordCubit(
        ForgetPasswordRepoImpl(
          ApiService(DioClient.createDio()),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: const Text(
            "Forget Password",
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
        body: const ForgetPasswordViewBody(),
      ),
    );
  }
}
