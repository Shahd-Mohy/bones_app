import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/widgets/contacts.dart';
import 'package:bones_app/core/widgets/custom_large_button.dart';
import 'package:bones_app/core/widgets/custom_text_field.dart';
import 'package:bones_app/features/patient_register/presentation/view_model/cubit/patient_register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PatientRegisterViewBody extends StatefulWidget {
  const PatientRegisterViewBody({super.key});

  @override
  State<PatientRegisterViewBody> createState() =>
      _PatientRegisterViewBodyState();
}

class _PatientRegisterViewBodyState extends State<PatientRegisterViewBody> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSignUpPressed(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<PatientRegisterCubit>(context).registerPatient(
        name: _fullNameController.text.trim(),
        phone: _phoneNumberController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        confirmPassword: _confirmPasswordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientRegisterCubit, PatientRegisterState>(
      listener: (context, PatientRegisterState state) {
        if (state is PatientRegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Center(child: Text("Welcome to our App")),
              backgroundColor: Colors.green,
            ),
          );
          GoRouter.of(context).push(AppRouter.kPatientHomeView);
        } else if (state is PatientRegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(
                child: Text(
                  state.errMessage.toString(),
                ),
              ),
              backgroundColor: Colors.red,
            ),
          );
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
                    controller: _fullNameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Full name is required';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: "Phone Number",
                    hintText: "Enter your phone number",
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Phone number is required';
                      }
                      if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                        return 'Enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: "Email",
                    hintText: "example@gmail.com",
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email is required';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                          .hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    label: "Password",
                    hintText: "Enter your password",
                    controller: _passwordController,
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
                    controller: _confirmPasswordController,
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
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  CustomLargeButton(
                    title: state is PatientRegisterLoading
                        ? "Loading..."
                        : "Sign Up",
                    onPressed: () => _onSignUpPressed(context),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Contacts(),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
