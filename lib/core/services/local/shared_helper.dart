import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static SharedPreferences? prefs;

  static initSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future setData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await prefs!.setString(key, value);
    if (value is int) return await prefs!.setInt(key, value);
    if (value is double) return await prefs!.setDouble(key, value);
    if (value is bool) return await prefs!.setBool(key, value);
  }

  static dynamic getData({required String key}) {
    return prefs!.get(key);
  }


  static Future removeData({required String key})async {
    return await prefs!.remove(key);
  }

  static Future clearAllData() async {
    return await prefs!.clear();
  }






}
