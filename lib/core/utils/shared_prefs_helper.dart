import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static const String _userIdKey = 'userId';
  static const String _userStringIdKey = 'userStringId';
  static const String _authTokenKey = 'auth_token';
  static const String _imageIdKey = 'image_id';
  static const String _userNameKey = 'user_name';
  static const String _userEmailKey = 'user_email';
  static const String _userPhoneKey = 'user_phone';

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // ================= User ID =================
  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }

  static Future<void> saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
  }

  static Future<void> clearUserId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
  }

  // ================= User String ID =================
  static Future<String?> getStringUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userStringIdKey);
  }

  static Future<void> saveStringUserId(String userIdString) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userStringIdKey, userIdString);
  }

  static Future<void> clearStringUserId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userStringIdKey);
  }

  // ================= Token =================
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_authTokenKey, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_authTokenKey);
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authTokenKey);
  }

  // ================= Image ID =================
  static Future<void> saveImageId(String imageId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_imageIdKey, imageId);
  }

  static Future<String?> getImageId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_imageIdKey);
  }

  static Future<void> clearImageId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_imageIdKey);
  }

  // ================= User Info =================
  static Future<void> saveUserInfo({
    required String name,
    required String email,
    required String phone,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userNameKey, name);
    await prefs.setString(_userEmailKey, email);
    await prefs.setString(_userPhoneKey, phone);
  }

  static Future<Map<String, String>> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString(_userNameKey) ?? '',
      'email': prefs.getString(_userEmailKey) ?? '',
      'phone': prefs.getString(_userPhoneKey) ?? '',
    };
  }

  static Future<void> clearUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userNameKey);
    await prefs.remove(_userEmailKey);
    await prefs.remove(_userPhoneKey);
  }
}
