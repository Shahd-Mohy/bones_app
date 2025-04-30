class PatientRegisterModel {
  bool success;
  String message;
  Data data;

  PatientRegisterModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory PatientRegisterModel.fromJson(Map<String, dynamic> json) {
    return PatientRegisterModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] as Data,
    );
  }
}

class Data {
  int id;
  String name;
  String email;
  String userId;
  int freeLimit;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.userId,
    required this.freeLimit,
  });
}
