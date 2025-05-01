import 'dart:io';
import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/widgets/custom_large_button.dart';
import 'package:bones_app/core/widgets/custom_text_field.dart';
import 'package:bones_app/features/specalist_register/presentation/view/widgets/Upload_certificat.dart';
import 'package:bones_app/features/specalist_register/presentation/view_model/cubit/specialist_register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SpecalistRegisterViewBody extends StatefulWidget {
  const SpecalistRegisterViewBody({super.key});

  @override
  State<SpecalistRegisterViewBody> createState() =>
      _SpecalistRegisterViewBodyState();
}

class _SpecalistRegisterViewBodyState extends State<SpecalistRegisterViewBody> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;

  File? certificateFile;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SpecialistRegisterCubit, SpecialistRegisterState>(
      listener: (context, state) {
        if (state is SpecialistRegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(child: Text(state.errorMessage)),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is SpecialistRegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Center(child: Text("Welcome to our app")),
              backgroundColor: Colors.green,
            ),
          );
          GoRouter.of(context).push(AppRouter.kSpecialistHomeView);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    label: "Full Name",
                    hintText: "Enter your name",
                    controller: fullNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: "Phone Number",
                    hintText: "Enter your phone number",
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: "Email",
                    hintText: "example@gmail.com",
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: "Password",
                    hintText: "Enter your password",
                    controller: passwordController,
                    isobsecureText: _isPasswordObscure,
                    sufIcon: IconButton(
                      icon: Icon(
                        _isPasswordObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordObscure = !_isPasswordObscure;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: "Confirm Password",
                    hintText: "Confirm your password here",
                    controller: confirmPasswordController,
                    isobsecureText: _isConfirmPasswordObscure,
                    sufIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordObscure =
                              !_isConfirmPasswordObscure;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  UploadCertificate(
                    onFilePicked: (file) {
                      setState(() {
                        certificateFile = file;
                      });
                    },
                  ),
                  const SizedBox(height: 40),
                  CustomLargeButton(
                    title: state is SpecialistRegisterLoading
                        ? "Loading..."
                        : "Sign Up",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (certificateFile == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please upload your certificate'),
                            ),
                          );
                          return;
                        }
                        BlocProvider.of<SpecialistRegisterCubit>(context)
                            .registerSpecialist(
                          name: fullNameController.text,
                          phone: phoneNumberController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                          role: 'Specialist',
                          certificateFile: certificateFile!,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Have an account ? ",
                            style: Styles.notesTextStyle
                                .copyWith(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () => GoRouter.of(context)
                                .push(AppRouter.kPatientLoginView),
                            child: Text(
                              "Login now!",
                              style: Styles.notesTextStyle
                                  .copyWith(color: kNotesColor),
                            ),
                          )
                        ],
                      ),
                    ),
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
