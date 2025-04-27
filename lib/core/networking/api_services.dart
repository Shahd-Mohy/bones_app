import 'package:dio/dio.dart';

class ApiService {
  ApiService(this.dio);
  final _baseUrl = 'https://bones.runasp.net/';
  final Dio dio;

  Future<Map<String, dynamic>> post({required String endPoint, data}) async {
    var response = await dio.post(
      '$_baseUrl$endPoint',
      data: data,
    );
    return response.data;
  }
}
