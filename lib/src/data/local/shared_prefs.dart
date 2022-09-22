import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final diamondProvider = FutureProvider<int>((ref) async {
  return await SharedPrefs.getConsumableValue();
});

class SharedPrefs {
  static Future<void> setConsumableValue(int value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt("consumable_value", value);
  }
  static Future<int> getConsumableValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? value = sharedPreferences.getInt("consumable_value");
    return value ?? 100;
  }
}
