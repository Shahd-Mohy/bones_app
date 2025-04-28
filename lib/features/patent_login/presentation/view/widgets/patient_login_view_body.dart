import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/widgets/contacts.dart';
import 'package:bones_app/core/widgets/custom_large_button.dart';
import 'package:bones_app/core/widgets/custom_text_field.dart';
import 'package:bones_app/features/patent_login/presentation/view_model/cubit/patient_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PatientLoginViewBody extends StatefulWidget {
  const PatientLoginViewBody({super.key});

  @override
  State<PatientLoginViewBody> createState() => _PatientLoginViewBodyState();
}

class _PatientLoginViewBodyState extends State<PatientLoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitLogin() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<PatientLoginCubit>(context).loginPatient(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return BlocConsumer<PatientLoginCubit, PatientLoginState>(
      listener: (context, state) {
        if (state is PatientLoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is PatientLoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login Successful"),
              backgroundColor: Colors.green,
            ),
          );
          GoRouter.of(context).pushReplacement(AppRouter.kPatientHomeView);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CheckboxTheme(
                        data: CheckboxThemeData(
                          side:
                              const BorderSide(width: 0.5, color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                        ),
                      ),
                      Text(
                        "Remember me",
                        style:
                            Styles.notesTextStyle.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  CustomTextFormField(
                    controller: _emailController,
                    label: "Email",
                    hintText: "example@gmail.com..",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                          .hasMatch(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  CustomTextFormField(
                    controller: _passwordController,
                    label: "Password",
                    hintText: "Enter your password..",
                    isobsecureText: !_isPasswordVisible,
                    sufIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: Text(
                          "Forgot Password ?",
                          style: Styles.notesTextStyle.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onTap: () => GoRouter.of(context)
                            .push(AppRouter.kForgetPasswordView),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.19),
                  CustomLargeButton(
                    title:
                        state is PatientLoginLoading ? "Loading..." : "Login",
                    onPressed: _submitLogin,
                  ),
                  SizedBox(height: height * 0.03),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style: Styles.notesTextStyle
                              .copyWith(color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () => GoRouter.of(context)
                              .push(AppRouter.kPatientRegisterView),
                          child: Text(
                            "Sign Up!",
                            style: Styles.notesTextStyle
                                .copyWith(color: kNotesColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  const Contacts(),
                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
