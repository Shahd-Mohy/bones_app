import 'package:bones_app/core/errors/failures.dart';
import 'package:bones_app/features/specalist_login/data/models/specialist_login_model.dart';
import 'package:bones_app/features/specalist_login/data/repos/specialist_login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SpecialistLoginRepoImp implements SpecialistLoginRepo {
  final Dio dio;
  SpecialistLoginRepoImp({required this.dio}) {
    dio.options.baseUrl = 'https://bones.runasp.net/';
  }

  @override
  Future<Either<Failure, SpecialistLoginModel>> loginSpecialist(
      {required String email,
      required String password,
      required String role}) async {
    try {
      var response = await dio.post('Account/Login', data: {
        'email': email,
        'password': password,
        'role': role,
      });
      return right(SpecialistLoginModel.fromjson(response.data));
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      print('💥 Error: $e');
      return left(ServerFailure('There is an error, please try again.'));
    }
  }
}
