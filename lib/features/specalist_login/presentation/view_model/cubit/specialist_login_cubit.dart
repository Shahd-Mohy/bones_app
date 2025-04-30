import 'package:bloc/bloc.dart';
import 'package:bones_app/features/specalist_login/data/models/specialist_login_model.dart';
import 'package:bones_app/features/specalist_login/data/repos/specialist_login_repo.dart';
import 'package:meta/meta.dart';

part 'specialist_login_state.dart';

class SpecialistLoginCubit extends Cubit<SpecialistLoginState> {
  final SpecialistLoginRepo specialistLoginRepo;

  SpecialistLoginCubit({required this.specialistLoginRepo})
      : super(SpecialistLoginInitial());

  Future<void> loginSpecialist({
    required String email,
    required String password,
  }) async {
    emit(SpecialistLoginLoading());
    final result = await specialistLoginRepo.loginSpecialist(
      email: email,
      password: password,
      role: 'specialist',
    );
    result.fold((Failure) => emit(SpecialistLoginFailure(Failure.errMessage)),
        (SpecialistLoginModel) {
      emit(SpecialistLoginSuccess(specialistLoginModel: SpecialistLoginModel));
    });
  }
}
