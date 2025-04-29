class SpecialistRegisterModel {
  final bool success;
  final String message;
  final String data;

  SpecialistRegisterModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SpecialistRegisterModel.fromJson(Map<String, dynamic> json) {
    return SpecialistRegisterModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] as String,
    );
  }
}

