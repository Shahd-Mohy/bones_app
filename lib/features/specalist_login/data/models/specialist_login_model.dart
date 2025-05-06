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
        data: Data.fromJson(json['data']));
  }
}

class Data {
  String token;
  DateTime expire;
  String userId;
  UserData userData;

  Data({
    required this.token,
    required this.expire,
    required this.userId,
    required this.userData,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json['token'],
      expire: DateTime.parse(json['expire']),
      userId: json['userId'],
      userData: UserData.fromJson(json['userData']),
    );
  }
}

class UserData {
  int id;
  String userName;
  String email;
  dynamic phoneNumber;

  UserData({
    required this.id,
    required this.userName,
    required this.email,
    required this.phoneNumber,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
