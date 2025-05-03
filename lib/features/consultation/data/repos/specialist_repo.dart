import 'package:bones_app/core/errors/failures.dart';
import 'package:bones_app/core/networking/api_services.dart';
import 'package:bones_app/features/consultation/data/models/specialist_model.dart';
import 'package:dartz/dartz.dart';

class SpecialistRepo {
  final ApiService apiService;

  SpecialistRepo(this.apiService);

  Future<Either<Failure, List<SpecialistModel>>> fetchAllSpecialists() async {
    try {
      final data = await apiService.get(endPoint: 'api/Specialist/GetAll');
      final specialists =
          (data as List).map((e) => SpecialistModel.fromJson(e)).toList();
      return Right(specialists);

      // final data = await apiService.get(endPoint: 'api/Specialist/GetAll');
      // List<SpecialistModel> specialists = [];
      // for (var element in data) {
      //   specialists.add(SpecialistModel.fromJson(element));

      // }
      // return Right(specialists);
      
    } catch (e) {
      print('💥 Error: $e');
      return left(ServerFailure('Can\'t fetch specialists'));
    }
  }
}
