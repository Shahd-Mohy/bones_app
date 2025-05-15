class UploadImageModel {
  final bool success;
  final dynamic message;
  final List<UploadImageDatum> data;

  UploadImageModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UploadImageModel.fromJson(Map<String, dynamic> json) {
    return UploadImageModel(
      success: json['success'] as bool,
      message: json['message'],
      data: (json['data'] as List<dynamic>)
          .map((e) => UploadImageDatum.fromJson(e))
          .toList(),
    );
  }
}

class UploadImageDatum {
  final dynamic errorMessage;
  final bool isSuccess;
  final String statusCode;
  final UploadImageData data;

  UploadImageDatum({
    required this.errorMessage,
    required this.isSuccess,
    required this.statusCode,
    required this.data,
  });

  factory UploadImageDatum.fromJson(Map<String, dynamic> json) {
    return UploadImageDatum(
      errorMessage: json['errorMessage'],
      isSuccess: json['isSuccess'] as bool,
      statusCode: json['statusCode'] as String,
      data: UploadImageData.fromJson(json['data']),
    );
  }
}

class UploadImageData {
  final String id;
  final String status;
  final String filename;
  final String format;
  final DateTime receivedTime;
  final double modelTimeSeconds;
  final String bodyPart;
  final double confidence;
  final String prediction;
  final double fractureConfidence;
  final String error;

  UploadImageData({
    required this.id,
    required this.status,
    required this.filename,
    required this.format,
    required this.receivedTime,
    required this.modelTimeSeconds,
    required this.bodyPart,
    required this.confidence,
    required this.prediction,
    required this.fractureConfidence,
    required this.error,
  });

  factory UploadImageData.fromJson(Map<String, dynamic> json) {
    return UploadImageData(
      id: json['id'] as String,
      status: json['status'] as String,
      filename: json['filename'] as String,
      format: json['format'] as String,
      receivedTime: DateTime.parse(json['received_time']),
      modelTimeSeconds: (json['model_time_seconds'] as num).toDouble(),
      bodyPart: json['body_part'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      prediction: json['prediction'] ?? '',
      fractureConfidence: (json['fracture_confidence'] as num).toDouble(),
      error: json['error'] ?? '',
    );
  }
}
