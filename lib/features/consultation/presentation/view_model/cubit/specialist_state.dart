part of 'specialist_cubit.dart';

@immutable
sealed class SpecialistState {}

final class SpecialistInitial extends SpecialistState {}

final class SpecialistLoading extends SpecialistState {}

class SpecialistSuccess extends SpecialistState {
  final List<SpecialistModel> specialists;

  SpecialistSuccess(this.specialists);
}

final class SpecialistFailed extends SpecialistState {
  final String errorMessage;

  SpecialistFailed(this.errorMessage);
}
