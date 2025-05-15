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
    result.fold((failure) => emit(SpecialistLoginFailure(failure.errMessage)),
        (specialistLoginModel) async {
      await SharedPrefsHelper.clearAll();
      await SharedPrefsHelper.saveUserId(
          specialistLoginModel.data.userData.id.toString());
      final token = specialistLoginModel.data.token;
      await SharedPrefsHelper.saveToken(token);
      await SharedPrefsHelper.saveUserInfo(
        name: specialistLoginModel.data.userData.userName,
        email: specialistLoginModel.data.userData.email,
        phone: specialistLoginModel.data.userData.phoneNumber ?? '',
      );
      await SharedPrefsHelper.saveStringUserId(
          specialistLoginModel.data.userId);

      emit(SpecialistLoginSuccess(specialistLoginModel: specialistLoginModel));
    });
  }
}
