part of 'patient_login_cubit.dart';

@immutable
sealed class PatientLoginState {}

final class PatientLoginInitial extends PatientLoginState {}

final class PatientLoginLoading extends PatientLoginState {}

final class PatientLoginSuccess extends PatientLoginState {
  final PatientLoginModel patientLoginModel;
  PatientLoginSuccess({required this.patientLoginModel});
}

final class PatientLoginFailure extends PatientLoginState {
  final String errMessage;
  PatientLoginFailure(this.errMessage);
}
