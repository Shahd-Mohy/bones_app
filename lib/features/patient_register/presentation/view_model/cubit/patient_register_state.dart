part of 'patient_register_cubit.dart';

@immutable
sealed class PatientRegisterState {}

final class PatientRegisterInitial extends PatientRegisterState {}

class PatientRegisterSuccess extends PatientRegisterState {
  final PatientRegisterModel patientRegisterModel;

  PatientRegisterSuccess({required this.patientRegisterModel});
}

final class PatientRegisterLoading extends PatientRegisterState {}

final class PatientRegisterFailure extends PatientRegisterState {
  final String errMessage;
  PatientRegisterFailure(this.errMessage);
}
