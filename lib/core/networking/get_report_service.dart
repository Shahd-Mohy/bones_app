import 'package:bones_app/core/models/image_report_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageReportService {
  final Dio dio;

  ImageReportService(this.dio);

  Future<ImageReportModel> getImageReportById(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    final response = await dio.get(
      'https://bones.runasp.net/api/Image/GetReportById',
      queryParameters: {'Id': id},
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': '*/*',
        },
      ),
    );

    return ImageReportModel.fromJson(response.data);
  }
}
