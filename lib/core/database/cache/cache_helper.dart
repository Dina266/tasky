import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  late SharedPreferences sharedPreferences;
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveData({required String key, required bool value}) async {
    await sharedPreferences.setBool(key, value);
  }

  bool getData({required String key}) {
    return sharedPreferences.getBool(key)??true;
  }

}