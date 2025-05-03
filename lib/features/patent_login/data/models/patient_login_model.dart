class PatientLoginModel {
  bool success;
  String message;
  Data data;

  PatientLoginModel({
    required this.success,
    required this.message,
    required this.data,
  });
  factory PatientLoginModel.fromjson(Map<String, dynamic> json) {
    return PatientLoginModel(
      success: json['success'],
      message: json['message'],
      data: Data(
        token: json['data']['token'],
        expire: DateTime.parse(json['data']['expire']),
        userId: json['data']['userId'],
      ),
    );
  }
}

class Data {
  String token;
  DateTime expire;
  String userId;

  Data({required this.token, required this.expire, required this.userId});
}
