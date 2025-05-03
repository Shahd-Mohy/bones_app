class SpecialistModel {
  final int id;
  final String name;
  final String email;
  final String userId;
  final String phoneNumber;

  SpecialistModel({
    required this.id,
    required this.name,
    required this.email,
    required this.userId,
    required this.phoneNumber,
  });

  factory SpecialistModel.fromJson(Map<String, dynamic> json) {
    return SpecialistModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      userId: json['userId'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
