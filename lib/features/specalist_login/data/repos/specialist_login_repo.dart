import 'package:bones_app/core/errors/failures.dart';
import 'package:bones_app/features/specalist_login/data/models/specialist_login_model.dart';
import 'package:dartz/dartz.dart';

abstract class SpecialistLoginRepo {
  Future<Either<Failure, SpecialistLoginModel>> loginSpecialist(
      {required String email, required String password, required String role});
}
