class ImageReportModel {
  final bool success;
  final dynamic message;
  final ReportData data;

  ImageReportModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ImageReportModel.fromJson(Map<String, dynamic> json) {
    return ImageReportModel(
      success: json['success'],
      message: json['message'],
      data: ReportData.fromJson(json['data']),
    );
  }
}

class ReportData {
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

  ReportData({
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

  factory ReportData.fromJson(Map<String, dynamic> json) {
    return ReportData(
      id: json['id'],
      status: json['status'],
      filename: json['filename'],
      format: json['format'],
      receivedTime: DateTime.parse(json['received_time']),
      modelTimeSeconds: json['model_time_seconds'].toDouble(),
      bodyPart: json['body_part'],
      confidence: json['confidence'].toDouble(),
      prediction: json['prediction'],
      fractureConfidence: json['fracture_confidence'].toDouble(),
      error: json['error'],
    );
  }
}
