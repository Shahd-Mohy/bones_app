import 'dart:async';
import 'package:bones_app/constants.dart';
import 'package:bones_app/core/networking/api_services.dart';
import 'package:bones_app/core/networking/dio_client.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/widgets/custom_large_button.dart';
import 'package:bones_app/features/forget_password/presentation/view/widgets/custom_number_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CodeVerificationBody extends StatefulWidget {
  final String email;
  const CodeVerificationBody({super.key, required this.email});
 
  @override
  State<CodeVerificationBody> createState() => _CodeVerificationBodyState();
}

class _CodeVerificationBodyState extends State<CodeVerificationBody> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  Timer? _timer;
  int _secondsRemaining = 50;
  late final ApiService _apiService;

  @override
  void initState() {
    super.initState();
    _apiService = ApiService(DioClient.createDio());
    _controllers = List.generate(4, (_) => TextEditingController());
    _focusNodes = List.generate(4, (_) => FocusNode());
    _startTimer();
  }

  void _startTimer() {
    setState(() => _secondsRemaining = 50);
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  void _onResendCode() async {
    _startTimer();

    try {
      final response = await _apiService.post(
        endPoint: 'api/Account/ForgetPassword',
        data: {
          'email': widget.email,
        },
      );

      if (response['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Center(child: Text("Code resent")),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        _showError(response['message'] ?? 'Failed to resend code');
      }
    } catch (e) {
      _showError("Error occurred while resending code");
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(message)),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> _verifyCode() async {
    String code = _controllers.map((e) => e.text).join();
    if (code.length == 4) {
      try {
        final response = await _apiService.verifyResetCode(
          email: widget.email,
          code: code,
        );

        if (response['success'] == true) {
          GoRouter.of(context).push(
            AppRouter.kResetPasswordView,
            extra: {
              'email': widget.email,
              'code': code,
            },
          );
        } else {
          _showError(response['message'] ?? 'Invalid code');
        }
      } catch (e) {
        _showError('Failed to verify code');
      }
    } else {
      _showError('Please enter 4 digits');
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Password will be set in minutes',
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Center(
              child: Text(
                'Enter the code you received, Please',
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return CustomNumberTextField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  nextFocusNode: index < 3 ? _focusNodes[index + 1] : null,
                  previousFocusNode: index > 0 ? _focusNodes[index - 1] : null,
                );
              }),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: _secondsRemaining == 0 ? _onResendCode : null,
              child: _secondsRemaining == 0
                  ? Text(
                      "Resend Code!",
                      style: Styles.notesTextStyle.copyWith(
                        decoration: TextDecoration.underline,
                        color: Colors.red,
                      ),
                    )
                  : RichText(
                      text: TextSpan(
                        style: Styles.notesTextStyle.copyWith(
                          decoration: TextDecoration.underline,
                          color: kIconSoftGreyColor,
                        ),
                        children: [
                          const TextSpan(text: "Resend code in "),
                          TextSpan(
                            text: '$_secondsRemaining',
                            style: const TextStyle(color: Colors.red),
                          ),
                          const TextSpan(text: " seconds"),
                        ],
                      ),
                    ),
            ),
            const SizedBox(height: 20),
            CustomLargeButton(
              title: 'Verify',
              onPressed: _verifyCode,
            ),
          ],
        ),
      ),
    );
  }
}
