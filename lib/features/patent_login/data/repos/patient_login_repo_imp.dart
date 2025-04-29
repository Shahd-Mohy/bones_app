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
        'account/login',
        data: {
          'email': email,
          'password': password,
          'role': role,
        },
      );
      return right(PatientLoginModel.fromjson(response.data));
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure('Unexpected error, please try again.'));
    }
  }
}
