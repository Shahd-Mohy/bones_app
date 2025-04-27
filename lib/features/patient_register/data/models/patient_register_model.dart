class PatientRegisterModel {
  bool success;
  String message;
  String data;

  PatientRegisterModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory PatientRegisterModel.fromjson(Map<String, dynamic> json) =>
      PatientRegisterModel(
        success: json['success'] as bool,
        message: json['message'] as String,
        data: json['data'] as String,
      );
}
