import 'dart:async';
import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/app_router.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/widgets/custom_large_button.dart';
import 'package:bones_app/features/forget_password/presentation/view/widgets/custom_number_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CodeVerificationView extends StatelessWidget {
  const CodeVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: const Text(
          "Forgrt Password",
          style: Styles.textStyle20,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const CodeVerificationBody(),
    );
  }
}

class CodeVerificationBody extends StatefulWidget {
  const CodeVerificationBody({super.key});

  @override
  State<CodeVerificationBody> createState() => _CodeVerificationBodyState();
}

class _CodeVerificationBodyState extends State<CodeVerificationBody> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  Timer? _timer;
  int _secondsRemaining = 50;

  @override
  void initState() {
    super.initState();
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

  void _onResendCode() {
    _startTimer();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Center(child: Text("Code resent")),
        backgroundColor: Colors.green,
      ),
    );
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
                'Enter the code you recieved, Please',
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
              onPressed: () {
                String code = _controllers.map((e) => e.text).join();
                if (code.length == 4) {
                  GoRouter.of(context).push(AppRouter.kResetPasswordView);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Center(child: Text('Please enter 4 digits')),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
