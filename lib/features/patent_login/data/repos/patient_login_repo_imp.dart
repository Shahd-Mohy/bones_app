import 'package:bones_app/core/errors/failures.dart';
import 'package:bones_app/core/networking/api_services.dart';
import 'package:bones_app/features/patent_login/data/models/patient_login_model.dart';
import 'package:bones_app/features/patent_login/data/repos/patient_login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PatientLoginRepoImp implements PatientLoginRepo {
  final Dio dio;
  final ApiService apiService;

  PatientLoginRepoImp(this.dio, {required this.apiService}) {
    dio.options.baseUrl = 'https://bones.runasp.net/';
  }

  @override
  Future<Either<Failure, PatientLoginModel>> loginPatient({
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      var response = await dio.post(
        'Account/Login',
        data: {
          'email': email,
          'password': password,
          'role': role,
        },
      );
      return right(PatientLoginModel.fromJson(response.data));
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      print('💥 Error: $e');
      return left(ServerFailure('Unexpected error, please try again.'));
    }
  }
}
