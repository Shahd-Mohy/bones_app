import 'package:dio/dio.dart';

class ApiService {
  ApiService(this.dio);
  final _baseUrl = 'https://bones.runasp.net/';
  final Dio dio;

  Future<Map<String, dynamic>> post({required String endPoint, data}) async {
    var response = await dio.post('$_baseUrl$endPoint', data: data);
    return response.data;
  }

  Future<dynamic> get({required String endPoint}) async {
    var response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> verifyResetCode({
  required String email,
  required String code,
}) async {
  final response = await dio.post(
    'https://bones.runasp.net/api/Account/VerifyResetCode',
    data: {
      "email": email,
      "code": code,
    },
  );
  return response.data;
}

}
