import 'dart:io';
import 'package:bones_app/core/errors/failures.dart';
import 'package:bones_app/features/specalist_register/data/models/specialist_register_model.dart';
import 'package:dartz/dartz.dart';

abstract class SpecialistRegisterRepo {
  Future<Either<Failure, SpecialistRegisterModel>> registerSpecialist({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
    required String role,
    required String phoneNumber,
    required File certificateFile,
  });
}
