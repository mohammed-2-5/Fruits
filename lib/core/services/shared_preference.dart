import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSingleton {
  // Static late variable to hold the instance of SharedPreferences
  static late SharedPreferences _instance;

  // Private constructor to prevent direct instantiation
  SharedPreferencesSingleton._internal();

  // Static method to initialize the SharedPreferences instance
  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  // Getter to access the SharedPreferences instance
  static SharedPreferences get instance => _instance;

  // Getter and setter for a boolean value
  static  getBool(String key) {
    return _instance.getBool(key);
  }

  static  setBool(String key, bool value)  {
    _instance.setBool(key, value);
  }

  // Example: Getter and Setter for a string value
  static String? getString(String key) {
    return _instance.getString(key);
  }

  static Future<void> setString(String key, String value) async {
    await _instance.setString(key, value);
  }

// Add more methods here for other data types as needed
}
