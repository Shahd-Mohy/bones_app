import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/widgets/custom_large_button.dart';
import 'package:bones_app/core/widgets/custom_text_field.dart';
import 'package:bones_app/features/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          GoRouter.of(context).push(
            AppRouter.kCodeVerifyView,
            extra: emailController.text.trim(),
          );
        } else if (state is ForgetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is ForgetPasswordLoading;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            'Enter your email or phone number',
                            style: Styles.textStyle14,
                          ),
                        ),
                        Center(
                          child: Text(
                            'to change your password',
                            style: Styles.textStyle14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomTextFormField(
                    label: "Email",
                    hintText: "example@gmail.com",
                    controller: emailController,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your email' : null,
                  ),
                  const SizedBox(height: 10),
                  CustomLargeButton(
                    title: isLoading ? 'Sending...' : 'Send Code',
                    onPressed: isLoading
                        ? () {}
                        : () {
                            if (_formKey.currentState!.validate()) {
                              context
                                  .read<ForgetPasswordCubit>()
                                  .sendCode(emailController.text);
                            }
                          },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
