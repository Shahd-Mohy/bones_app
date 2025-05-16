import 'package:bones_app/core/networking/api_services.dart';

abstract class ForgetPasswordRepo {
  Future<Map<String, dynamic>> sendForgetPasswordEmail(String email);
}

class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final ApiService apiService;

  ForgetPasswordRepoImpl(this.apiService);

  @override
  Future<Map<String, dynamic>> sendForgetPasswordEmail(String email) async {
    return await apiService.post(
      endPoint: 'api/Account/ForgetPassword',
      data: {'email': email},
    );
  }
}
