import 'package:bones_app/core/errors/failures.dart';
import 'package:bones_app/core/networking/api_services.dart';
import 'package:bones_app/features/patent_login/data/models/patient_login_model.dart';
import 'package:bones_app/features/patent_login/data/repos/patient_login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PatientLoginRepoImp implements PatientLoginRepo {
  final Dio dio;
  PatientLoginRepoImp(this.dio, {required ApiService apiService}) {
    dio.options.baseUrl = 'https://bones.runasp.net/';
  }

  @override
  Future<Either<Failure, PatientLoginModel>> loginPatient(
      {required String email,
      required String password,
      required String role}) async {
    try {
      var response = await dio.post(
        'account/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return right(PatientLoginModel.fromjson(response.data));
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
