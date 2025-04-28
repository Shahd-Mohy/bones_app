
class PatientLoginModel {
  String jwtSecurityToken;
  String expire;
  PatientLoginModel({required this.jwtSecurityToken, required this.expire});

  factory PatientLoginModel.fromjson(Map<String, dynamic> json) => PatientLoginModel(
    expire: json['expire'] as String, 
    jwtSecurityToken: json['jwtSecurityToken'] as String,
  );
}
