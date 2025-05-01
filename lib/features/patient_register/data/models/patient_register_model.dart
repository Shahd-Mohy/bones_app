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
      data: Data.fromJson(json['data']),
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

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      userId: json['userId'],
      freeLimit: json['freeLimit'],
    );
  }
}
