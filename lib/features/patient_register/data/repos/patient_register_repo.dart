import 'package:bones_app/core/errors/failures.dart';
import 'package:bones_app/features/patient_register/data/models/patient_register_model.dart';
import 'package:dartz/dartz.dart';

abstract class PatientRegisterRepo {
  Future<Either<Failure, PatientRegisterModel>> registerPatient({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
    required String role,
    required String phoneNumber,
  });
}
