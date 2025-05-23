import 'package:bones_app/constants.dart';
import 'package:bones_app/core/networking/payment_service.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/widgets/custom_large_button.dart';
import 'package:bones_app/core/widgets/custom_text_field.dart';
import 'package:bones_app/features/payment/data/models/payment_model.dart';
import 'package:bones_app/features/payment/presentation/view/widgets/payment_webview.dart';
import 'package:bones_app/features/payment/presentation/view_model/cubit/payment_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key});

  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  final List<Map<String, dynamic>> userTypes = [
    {'label': 'Patient (100 EGP)', 'value': 100},
    {'label': 'Specialist (200 EGP)', 'value': 200},
    {'label': 'Premium (500 EGP)', 'value': 500},
  ];

  Map<String, dynamic>? selectedUserType;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    _emailController.text = prefs.getString('email') ?? '';
    _phoneController.text = prefs.getString('phone') ?? '';
  }

  void _submitPayment(BuildContext context) async {
    if (!_formKey.currentState!.validate() || selectedUserType == null) return;

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final model = PaymentModel(
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      amount: selectedUserType!['value'],
    );

    final cubit = context.read<PaymentCubit>();
    cubit.submitPayment(model, token);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentCubit(PaymentService(Dio())),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) async {
            if (state is PaymentSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PaymentWebView(iframeUrl: state.iframeUrl),
                ),
              );
            } else if (state is PaymentFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Payment failed: ${state.error}'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildSectionCard(
                      title: "👤 Select Account Type",
                      child: DropdownButtonFormField<Map<String, dynamic>>(
                        value: selectedUserType,
                        decoration: _inputDecoration(),
                        items: userTypes.map((type) {
                          return DropdownMenuItem<Map<String, dynamic>>(
                            value: type,
                            child: Text(type['label']),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedUserType = value;
                            _amountController.text =
                                value?['value'].toString() ?? '';
                          });
                        },
                        validator: (value) =>
                            value == null ? "Please select a type" : null,
                      ),
                    ),
                    _buildSectionCard(
                      title: "📱 Phone Number",
                      child: CustomTextFormField(
                        controller: _phoneController,
                        hintText: 'e.g., 01234567890',
                        keyboardType: TextInputType.phone,
                        validator: (value) =>
                            value!.isEmpty ? "Phone required" : null,
                        label: '',
                      ),
                    ),
                    _buildSectionCard(
                      title: "📧 Email Address",
                      child: CustomTextFormField(
                        controller: _emailController,
                        hintText: 'example@mail.com',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            value!.isEmpty ? "Email required" : null,
                        label: '',
                      ),
                    ),
                    _buildSectionCard(
                      title: "💰 Amount",
                      child: TextFormField(
                        controller: _amountController,
                        enabled: false,
                        style: Styles.notesTextStyle.copyWith(
                          color: Colors.black, // you can adjust this
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: kTextFieldColor,
                          hintText: 'amount will appear here',
                          hintStyle: Styles.notesTextStyle.copyWith(
                            color: Colors.grey,
                          ),
                          prefixIcon: null,
                          suffixIcon: null,
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomLargeButton(
                      color: kSecondaryColor.withOpacity(0.7),
                      title: "Pay Now",
                      onPressed: () => _submitPayment(context),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
        border: Border.all(color: kTextFieldColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Styles.textStyle16
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: kTextFieldColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: kSecondaryColor, width: 2),
      ),
    );
  }
}
