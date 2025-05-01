import 'dart:io';
import 'package:bones_app/core/errors/failures.dart';
import 'package:bones_app/core/networking/api_services.dart';
import 'package:bones_app/features/specalist_register/data/models/specialist_register_model.dart';
import 'package:bones_app/features/specalist_register/data/repos/spacialist_register_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SpecialistRegisterRepoImp implements SpecialistRegisterRepo {
  final Dio dio;

  SpecialistRegisterRepoImp(this.dio, {required ApiService apiService}) {
    dio.options.baseUrl = 'https://bones.runasp.net/';
  }

  @override
  Future<Either<Failure, SpecialistRegisterModel>> registerSpecialist(
      {required String fullName,
      required String phoneNumber,
      required String email,
      required String password,
      required String confirmPassword,
      required String role,
      required File certificateFile}) async {
    try {
      final response = await dio.post(
        'Account/Register',
        data: FormData.fromMap({
          'FullName': fullName,
          'PhoneNumber': phoneNumber,
          'Email': email,
          'Password': password,
          'ConfirmPassword': confirmPassword,
          'Role': 'Specialist', // Match the server-required format
          'CertificateFile': await MultipartFile.fromFile(
            certificateFile.path,
            filename: certificateFile.path.split('/').last,
          ),
        }),
        options: Options(headers: {
          'Content-Type': 'multipart/form-data',
        }),
      );
      return right(SpecialistRegisterModel.fromJson(response.data));
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
