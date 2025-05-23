part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentSuccess extends PaymentState {
  final String iframeUrl;
  PaymentSuccess(this.iframeUrl);
}

class PaymentFailure extends PaymentState {
  final String error;
  PaymentFailure(this.error);
}
