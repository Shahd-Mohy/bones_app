import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ImageUploadService {
  final Dio dio;

  ImageUploadService({required this.dio});

  Future<Response> uploadImage({
    required File imageFile,
    required String userId,
    required String bodyPart, // ✅ Add body part
  }) async {
    String fileName = imageFile.path.split('/').last;

    FormData formData = FormData.fromMap({
      "UserId": userId,
      "BodyPart": bodyPart, // ✅ Send body part to backend
      "ImageFile": await MultipartFile.fromFile(
        imageFile.path,
        filename: fileName,
      ),
      "UploadedAt": DateTime.now().toIso8601String(),
    });

    try {
      final response = await dio.post(
        'https://bones.runasp.net/api/Image/UploadImage',
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );
      return response;
    } on DioException catch (e) {
      debugPrint("Upload failed: ${e.response?.data}");
      return e.response!;
    }
  }
}
