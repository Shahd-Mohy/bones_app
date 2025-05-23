class PaymentModel {
  final String email;
  final String phone;
  final int amount;

  PaymentModel({
    required this.email,
    required this.phone,
    required this.amount,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'phone': phone,
    'amount': amount,
  };
}

