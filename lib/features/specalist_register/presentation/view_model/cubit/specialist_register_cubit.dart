import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bones_app/core/utils/shared_prefs_helper.dart';
import 'package:bones_app/features/specalist_register/data/models/specialist_register_model.dart';
import 'package:bones_app/features/specalist_register/data/repos/spacialist_register_repo.dart';
import 'package:meta/meta.dart';

part 'specialist_register_state.dart';

class SpecialistRegisterCubit extends Cubit<SpecialistRegisterState> {
  final SpecialistRegisterRepo specialistRegisterRepo;
  SpecialistRegisterCubit({required this.specialistRegisterRepo})
      : super(SpecialistRegisterInitial());
  Future<void> registerSpecialist({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required String role,
    required File certificateFile,
  }) async {
    emit(SpecialistRegisterLoading());
    try {
      final result = await specialistRegisterRepo.registerSpecialist(
        fullName: name,
        phoneNumber: phone,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        role: 'specialist',
        certificateFile: certificateFile,
      );
      result.fold(
          (Failure) => emit(SpecialistRegisterFailure(Failure.errMessage)),
          (SpecialistRegisterModel) async {
        await SharedPrefsHelper.saveUserId(
            SpecialistRegisterModel.data.userData.id.toString());
        final token = SpecialistRegisterModel.data.token;
        await SharedPrefsHelper.saveToken(token);

        emit(SpecialistRegisterSuccess(
            specialistRegisterModel: SpecialistRegisterModel));
      });
    } catch (e) {
      emit(SpecialistRegisterFailure(e.toString()));
    }
  }
}
