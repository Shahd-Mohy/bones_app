import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageUploadService {
  final Dio dio;

  ImageUploadService({required this.dio}) {
    // Attach PrettyDioLogger for debug logging
    assert(() {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 120,
      ));
      return true;
    }());
  }

  Future<Response> uploadImage({
    required File imageFile,
    required String userId,
    required String bodyPart,
  }) async {
    String fileName = imageFile.path.split('/').last;

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token == null) {
      throw Exception('Auth token not found.');
    }

    FormData formData = FormData.fromMap({
      "Id": int.parse(userId),
      "BodyPart": bodyPart,
      "UploadedAt":
          DateTime.now().toUtc().toIso8601String().substring(0, 23) + 'Z',
      "ImageFiles": [
        await MultipartFile.fromFile(imageFile.path, filename: fileName)
      ],
    });

    debugPrint('Sending FormData:');
    debugPrint('Id: $userId');
    debugPrint('BodyPart: $bodyPart');
    debugPrint('UploadedAt: ${DateTime.now().toUtc().toIso8601String()}');
    debugPrint('ImageFile: $fileName');
    debugPrint('Token: Bearer $token');

    try {
      final response = await dio.post(
        'https://bones.runasp.net/api/Image/UploadImage',
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return response;
    } on DioException catch (e) {
      debugPrint("Upload failed: ${e.response?.data}");
      return e.response!;
    }
  }
}
