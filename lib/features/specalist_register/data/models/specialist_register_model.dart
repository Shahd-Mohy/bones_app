class SpecialistRegisterModel {
  bool success;
  String message;
  Data data;

  SpecialistRegisterModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SpecialistRegisterModel.fromJson(Map<String, dynamic> json) {
    return SpecialistRegisterModel(
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
  String? phoneNumber;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.userId,
    required this.phoneNumber,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      userId: json['userId'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
