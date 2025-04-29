part of 'specialist_register_cubit.dart';

@immutable
sealed class SpecialistRegisterState {}

final class SpecialistRegisterInitial extends SpecialistRegisterState {}

final class SpecialistRegisterLoading extends SpecialistRegisterState {}

final class SpecialistRegisterSuccess extends SpecialistRegisterState {
  final SpecialistRegisterModel specialistRegisterModel;

  SpecialistRegisterSuccess({required this.specialistRegisterModel});
}

final class SpecialistRegisterFailure extends SpecialistRegisterState {
  final String errorMessage;

  SpecialistRegisterFailure(this.errorMessage);
}
