import 'package:bloc/bloc.dart';
import 'package:bones_app/core/utils/shared_prefs_helper.dart';
import 'package:bones_app/features/patient_register/data/repos/patient_register_repo.dart';
import 'package:meta/meta.dart';
import 'package:bones_app/features/patient_register/data/models/patient_register_model.dart';

part 'patient_register_state.dart';

class PatientRegisterCubit extends Cubit<PatientRegisterState> {
  final PatientRegisterRepo patientRegisterRepo;

  PatientRegisterCubit({required this.patientRegisterRepo})
      : super(PatientRegisterInitial());

  Future<void> registerPatient({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(PatientRegisterLoading());
    try {
      final result = await patientRegisterRepo.registerPatient(
        fullName: name,
        phoneNumber: phone,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        role: 'patient',
      );

      result.fold((failure) => emit(PatientRegisterFailure(failure.errMessage)),
          (patientRegisterModel) async {
        await SharedPrefsHelper.clearAll();
        await SharedPrefsHelper.saveUserId(
            patientRegisterModel.data.userData.id.toString());
        final token = patientRegisterModel.data.token;
        await SharedPrefsHelper.saveToken(token);
        await SharedPrefsHelper.saveUserInfo(
          name: patientRegisterModel.data.userData.userName,
          email: patientRegisterModel.data.userData.email,
          phone: patientRegisterModel.data.userData.phoneNumber,
        );

        emit(
            PatientRegisterSuccess(patientRegisterModel: patientRegisterModel));
      });
    } catch (e) {
      emit(PatientRegisterFailure(e.toString()));
    }
  }
}
