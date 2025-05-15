import 'package:bones_app/core/models/retrieved_images_model.dart';
import 'package:bones_app/core/networking/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetUploadedImagesService {
  final Dio _dio = DioClient.createDio();

  Future<List<RetrievedImagesModel>> fetchUserImages(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      if (token == null) {
        throw Exception('No token found in storage');
      }

      final response = await _dio.get(
        'https://bones.runasp.net/api/Patient/GetAllPatientUploadedImages',
        queryParameters: {
          'Id': userId,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        final List<dynamic> imageList = data['data'];

        final images = imageList
            .map((imageJson) => RetrievedImagesModel.fromJson(imageJson))
            .toList();
        return images;
      } else {
        throw Exception(
            'Failed to fetch images. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching uploaded images');
    }
  }
}
