import 'package:bones_app/core/errors/failures.dart';
import 'package:bones_app/core/networking/api_services.dart';
import 'package:bones_app/features/patient_register/data/models/patient_register_model.dart';
import 'package:bones_app/features/patient_register/data/repos/patient_register_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PatientRegisterRepoImp implements PatientRegisterRepo {
  final ApiService apiService;
  PatientRegisterRepoImp(this.apiService);
  @override
  Future<Either<Failure, PatientRegisterModel>> registerPatient(
      {required String fullName,
      required String email,
      required String password,
      required String confirmPassword,
      required String role,
      required String phoneNumber}) async {
    try {
      var data = await apiService.post(
        endPoint: 'account/register',
        data: {
          'FullName': fullName,
          'Email': email,
          'Password': password,
          'ConfirmPassword': confirmPassword,
          'Role': role,
          'PhoneNumber': phoneNumber,
        },
      );
      return right(PatientRegisterModel.fromjson(data));
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
