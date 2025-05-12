import 'package:bloc/bloc.dart';
import 'package:bones_app/core/utils/shared_prefs_helper.dart';
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
        (SpecialistLoginModel) async {
      await SharedPrefsHelper.clearUserId();
      await SharedPrefsHelper.saveUserId(
          SpecialistLoginModel.data.userData.id.toString());
      final token = SpecialistLoginModel.data.token;
      await SharedPrefsHelper.saveToken(token);
      emit(SpecialistLoginSuccess(specialistLoginModel: SpecialistLoginModel));
    });
  }
}
