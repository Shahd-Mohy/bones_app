import 'package:bones_app/core/errors/failures.dart';
import 'package:bones_app/features/patent_login/data/models/patient_login_model.dart';
import 'package:dartz/dartz.dart';

abstract class PatientLoginRepo {
  Future<Either<Failure, PatientLoginModel>> loginPatient({
    required String email,
    required String password,
    required String role,
  });
}
