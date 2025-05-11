import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ImageUploadService {
  final Dio dio;

  ImageUploadService({required this.dio});

  Future<Response> uploadImage({
    required File imageFile,
    required String userId,
    required String bodyPart,
  }) async {
    String fileName = imageFile.path.split('/').last;

    FormData formData = FormData.fromMap({
      "Id": int.parse(userId),
      "BodyPart": bodyPart,
      "UploadedAt":
          DateTime.now().toUtc().toIso8601String().substring(0, 23) + 'Z',
      "ImageFiles": [
        await MultipartFile.fromFile(imageFile.path, filename: fileName)
      ],
    });

    print('FormData being sent:');
    print('UserId: $userId');
    print('BodyPart: $bodyPart');
    print('UploadedAt: ${DateTime.now().toUtc().toIso8601String()}');
    print('ImageFiles: ${imageFile.path}');

    try {
      final response = await dio.post(
        'https://bones.runasp.net/api/Image/UploadImage',
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
          headers: {
            'Accept': 'application/json',
          },
        ),
      );

      return response;
    } on DioException catch (e) {
      debugPrint("Upload failed Deee: ${e.response?.data}");
      return e.response!;
    }
  }
}
