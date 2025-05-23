import 'package:bloc/bloc.dart';
import 'package:bones_app/core/networking/payment_service.dart';
import 'package:bones_app/features/payment/data/models/payment_model.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
final PaymentService paymentService;

  PaymentCubit(this.paymentService) : super(PaymentInitial());

  Future<void> submitPayment(PaymentModel model, String token) async {
    emit(PaymentLoading());
    try {
      final url = await paymentService.makePayment(model, token);
      emit(PaymentSuccess(url));
    } catch (e) {
      emit(PaymentFailure(e.toString()));
    }
  }}
