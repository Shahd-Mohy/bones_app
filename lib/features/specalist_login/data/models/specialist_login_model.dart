class SpecialistLoginModel {
  bool success;
  String message;
  Data data;

  SpecialistLoginModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SpecialistLoginModel.fromjson(Map<String, dynamic> json) {
    return SpecialistLoginModel(
      success: json['success'],
      message: json['message'],
      data: Data(
        token: json['data']['token'],
        expire: DateTime.parse(json['data']['expire']),
      ),
    );
  }
}

class Data {
  String token;
  DateTime expire;

  Data({
    required this.token,
    required this.expire,
  });
}

