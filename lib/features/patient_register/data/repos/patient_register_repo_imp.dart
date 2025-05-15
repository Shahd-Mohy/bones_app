import 'package:bones_app/core/errors/failures.dart';
import 'package:bones_app/core/networking/api_services.dart';
import 'package:bones_app/features/patient_register/data/models/patient_register_model.dart';
import 'package:bones_app/features/patient_register/data/repos/patient_register_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PatientRegisterRepoImp implements PatientRegisterRepo {
  final Dio dio;

  PatientRegisterRepoImp(this.dio, {required ApiService apiService}) {
    dio.options.baseUrl = 'https://bones.runasp.net/'; // <-- BASE URL FIXED
  }

  @override
  Future<Either<Failure, PatientRegisterModel>> registerPatient({
    required String fullName,
    required String phoneNumber,
    required String email,
    required String password,
    required String confirmPassword,
    required String role,
  }) async {
    try {
      final response = await dio.post(
        'Account/Register',
        data: FormData.fromMap({
          'FullName': fullName,
          'PhoneNumber': phoneNumber,
          'Email': email,
          'Password': password,
          'ConfirmPassword': confirmPassword,
          'Role': role,
        }),
      );

      return right(PatientRegisterModel.fromjson(response.data));
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
