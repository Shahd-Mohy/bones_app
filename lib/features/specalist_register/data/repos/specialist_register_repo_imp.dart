import 'dart:io';
import 'package:bones_app/core/errors/failures.dart';
import 'package:bones_app/features/specalist_register/data/models/specialist_register_model.dart';
import 'package:bones_app/features/specalist_register/data/repos/spacialist_register_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SpecialistRegisterRepoImp implements SpecialistRegisterRepo {
  final Dio dio;

  SpecialistRegisterRepoImp({required this.dio}) {
    dio.options.baseUrl = 'https://bones.runasp.net/';
  }
  @override
  Future<Either<Failure, SpecialistRegisterModel>> registerSpecialist(
      {required String fullName,
      required String email,
      required String password,
      required String confirmPassword,
      required String role,
      required String phoneNumber,
      required File certificateFile}) async {
    try {
      final response = await dio.post(
        'Account/register',
        data: FormData.fromMap({
          'FullName': fullName,
          'PhoneNumber': phoneNumber,
          'Email': email,
          'Password': password,
          'ConfirmPassword': confirmPassword,
          'Role': role,
          'CertificateFile': certificateFile
        }),
      );
      return right(SpecialistRegisterModel.fromJson(response.data));
    } on DioError catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure('Unexpected error, please try again.'));
    }
  }
}

