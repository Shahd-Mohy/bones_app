import 'package:bloc/bloc.dart';
import 'package:bones_app/core/utils/shared_prefs_helper.dart';
import 'package:bones_app/features/patent_login/data/models/patient_login_model.dart';
import 'package:bones_app/features/patent_login/data/repos/patient_login_repo.dart';
import 'package:meta/meta.dart';

part 'patient_login_state.dart';

class PatientLoginCubit extends Cubit<PatientLoginState> {
  final PatientLoginRepo patientLoginRepo;

  PatientLoginCubit({required this.patientLoginRepo})
      : super(PatientLoginInitial());

  Future<void> loginPatient({
    required String email,
    required String password,
  }) async {
    emit(PatientLoginLoading());
    final result = await patientLoginRepo.loginPatient(
      email: email,
      password: password,
      role: 'patient',
    );

    result.fold(
      (failure) => emit(PatientLoginFailure(failure.errMessage)),
      (patientLoginModel) async {
    await SharedPrefsHelper.clearUserId(); 
    await SharedPrefsHelper.saveUserId(patientLoginModel.data.userData.id.toString()); 
    emit(PatientLoginSuccess(patientLoginModel: patientLoginModel));
  },
    );
  }
}
