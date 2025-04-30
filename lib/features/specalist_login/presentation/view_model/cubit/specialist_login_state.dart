part of 'specialist_login_cubit.dart';

@immutable
sealed class SpecialistLoginState {}

final class SpecialistLoginInitial extends SpecialistLoginState {}

final class SpecialistLoginLoading extends SpecialistLoginState {}

final class SpecialistLoginSuccess extends SpecialistLoginState {
  final SpecialistLoginModel specialistLoginModel;

  SpecialistLoginSuccess({required this.specialistLoginModel});
}

final class SpecialistLoginFailure extends SpecialistLoginState {
  final String errorMessage;

  SpecialistLoginFailure(this.errorMessage);
}
