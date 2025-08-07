import 'package:shared_preferences/shared_preferences.dart';

class CachePrefHelper {
  static SharedPreferences? _preferences;

   static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

   static Future<void> saveData<T>(String key, T value) async {
    if (_preferences == null) return;

    if (value is String) {
      await _preferences!.setString(key, value);
    } else if (value is int) {
      await _preferences!.setInt(key, value);
    } else if (value is bool) {
      await _preferences!.setBool(key, value);
    } else if (value is double) {
      await _preferences!.setDouble(key, value);
    } else if (value is List<String>) {
      await _preferences!.setStringList(key, value);
    } else {
      throw Exception("Unsupported type");
    }
  }

   static T? getData<T>(String key) {
    if (_preferences == null) return null;

    if (T == String) {
      return _preferences!.getString(key) as T?;
    } else if (T == int) {
      return _preferences!.getInt(key) as T?;
    } else if (T == bool) {
      return _preferences!.getBool(key) as T?;
    } else if (T == double) {
      return _preferences!.getDouble(key) as T?;
    } else if (T == List<String>) {
      return _preferences!.getStringList(key) as T?;
    } else {
      throw Exception("Unsupported type");
    }
  }

  // Remove a value by key
  static Future<void> removeData(String key) async {
    await _preferences?.remove(key);
  }
}
