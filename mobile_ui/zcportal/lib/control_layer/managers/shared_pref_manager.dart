import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static final SharedPrefManager _singleton = SharedPrefManager._internal();

  factory SharedPrefManager() {
    return _singleton;
  }

  SharedPrefManager._internal();

  Future<SharedPreferences> get _sharedPref async =>
      await SharedPreferences.getInstance();
//========================================================================================
//---------Read & Write different data types in shared prefernces storage----------------
//========================================================================================
// ----------------------------------- String ---------------------------------------
  Future<String> getString({required String key}) async {
    final SharedPreferences sharedPref = await _sharedPref;
    return sharedPref.getString(key) ?? "";
  }

  void setString({required String key, required String value}) async {
    final SharedPreferences sharedPref = await _sharedPref;
    sharedPref.setString(key, value);
  }
// ----------------------------- bool --------------------------------------
  Future setBool({required String key,  bool value=false}) async {
    final SharedPreferences sharedPref = await _sharedPref;
    sharedPref.setBool(key, value);
  }

  Future<bool> getBool({required String key}) async {
    final SharedPreferences sharedPref = await _sharedPref;
    return sharedPref.getBool(key) ?? false;
  }

//----------------------------- int ----------------------------------------
  Future<bool> setInt({required String key, required int val}) async {
    final SharedPreferences sharedPref = await _sharedPref;
    return sharedPref.setInt(key, val);
  }

  Future<int> getInt({required String key}) async {
    final SharedPreferences sharedPref = await _sharedPref;
    return sharedPref.getInt(key) ?? -1000000000;
  }

// ---------------------------- Double --------------------------------------
  Future<bool> setDouble({required String key, required double val}) async {
    final SharedPreferences sharedPref = await _sharedPref;
    return sharedPref.setDouble(key, val);
  }

  Future<double> getDouble({required String key}) async {
    final SharedPreferences sharedPref = await _sharedPref;
    return sharedPref.getDouble(key) ?? -1000000000.0;
  }
//----------------------------- List -------------------------------------

  Future setListString(
      {required String key, required String id, required String token}) async {
    final SharedPreferences sharedPref = await _sharedPref;
    sharedPref.setStringList(key, [id, token]);
  }

  Future<List<String>> getListString({required String key}) async {
    final SharedPreferences sharedPref = await _sharedPref;
    return sharedPref.getStringList(key) ?? [];
  }
  
// ---------------------------- Map ---------------------------------------
  Future setMap({required String key, required Map value}) async {
    final SharedPreferences sharedPref = await _sharedPref;
    return sharedPref.setString(key, jsonEncode(value));
  }

  Future<Map> getMap({required String key}) async {
    final SharedPreferences sharedPref = await _sharedPref;
    return jsonDecode(sharedPref.getString(key) ?? "") ?? {};
  }

// ===========================================================================
//----------------------------- Delete ---------------------------------------
// ===========================================================================
  Future<void> removeKey({required String key}) async {
    final SharedPreferences sharedPref = await _sharedPref;
    sharedPref.remove(key);
  }

  void clearAll() async {
    final SharedPreferences sharedPref = await _sharedPref;
    sharedPref.clear();
  }
}
