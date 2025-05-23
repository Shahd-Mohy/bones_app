import 'package:bones_app/features/payment/data/models/payment_model.dart';
import 'package:dio/dio.dart';

class PaymentService {
  final Dio dio;

  PaymentService(this.dio);

  Future<String> makePayment(PaymentModel paymentModel, String token) async {
    final response = await dio.post(
      'https://bones.runasp.net/api/Payment/pay',
      data: paymentModel.toJson(),
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      }),
    );

    return response.data['iframeUrl'];
  }
}