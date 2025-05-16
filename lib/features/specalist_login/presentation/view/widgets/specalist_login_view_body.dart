import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/widgets/custom_large_button.dart';
import 'package:bones_app/core/widgets/custom_text_field.dart';
import 'package:bones_app/features/specalist_login/presentation/view_model/cubit/specialist_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SpecalistLoginViewBody extends StatefulWidget {
  const SpecalistLoginViewBody({super.key});

  @override
  State<SpecalistLoginViewBody> createState() => _SpecalistLoginViewBodyState();
}

class _SpecalistLoginViewBodyState extends State<SpecalistLoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitLogin() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<SpecialistLoginCubit>(context).loginSpecialist(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return BlocConsumer<SpecialistLoginCubit, SpecialistLoginState>(
      listener: (context, state) {
        if (state is SpecialistLoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(
                child: Text(state.errorMessage.toString()),
              ),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is SpecialistLoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Center(child: Text("Welcome to our app")),
              backgroundColor: Colors.green,
            ),
          );
          GoRouter.of(context).go(AppRouter.kSpecialistHomeView);
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
                  SizedBox(height: height * 0.03),
                  CustomLargeButton(
                    title: state is SpecialistLoginLoading
                        ? "Loading..."
                        : "Login",
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
                              .push(AppRouter.kSpecalistRegisterView),
                          child: Text(
                            "Sign Up!",
                            style: Styles.notesTextStyle
                                .copyWith(color: kNotesColor),
                          ),
                        ),
                      ],
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
