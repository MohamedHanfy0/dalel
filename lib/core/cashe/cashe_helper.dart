import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  static late SharedPreferences sharedPreferences;

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // this method to put data in data
  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  // this method put database in local databse using key
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  // remove key
  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  // clear all shared preferences
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }
}
