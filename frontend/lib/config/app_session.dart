import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AppSession {
  static Future<UserModel?> getUser() async {
    final pref = await SharedPreferences.getInstance();
    String? userString = pref.getString('user');
    if (userString == null) return null;
    var userMap = jsonDecode(userString);
    return UserModel.fromJson(userMap);
  }

  static Future<bool> setUser(Map userMap) async {
    final pref = await SharedPreferences.getInstance();
    String userString = jsonEncode(userMap);
    return await pref.setString('user', userString);
  }

  static Future<bool> removeUser() async {
    final pref = await SharedPreferences.getInstance();
    return await pref.remove('user');
  }

  static Future<String?> getBearerToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('bearer_token');
  }

  static Future<bool> setBearerToken(String bearerToken) async {
    final pref = await SharedPreferences.getInstance();
    return await pref.setString('bearer_token', bearerToken);
  }

  static Future<bool> removeBearerToken() async {
    final pref = await SharedPreferences.getInstance();
    return await pref.remove('bearer_token');
  }
}
