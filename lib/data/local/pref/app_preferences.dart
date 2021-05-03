import 'package:flutter_base_by_minhnv/data/local/pref/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class AppPreferences extends Preferences {
  String prefToken = "PREF_TOKEN";
  String prefLogin = "PREF_LOGIN";
  static final AppPreferences _singleton = AppPreferences.internal();

  factory AppPreferences() {
    return _singleton;
  }

  AppPreferences.internal();

  @override
  Future<void> saveToken(String? token) async {
    final preferences = await StreamingSharedPreferences.instance;
    await preferences.setString(prefToken, token ?? "");
    preferences.getString(prefToken, defaultValue: "default token").listen((value) {
      print("data: $value");
    });
  }

  @override
  Stream<String> getToken() async* {
    final preferences = await StreamingSharedPreferences.instance;
    yield preferences.getString(prefToken, defaultValue: "default token").getValue();
  }

  @override
  Future<bool> getFirstTimeLogin() async {
    final preferences = await StreamingSharedPreferences.instance;
    return preferences.getBool(prefLogin, defaultValue: false).first;
  }

  @override
  Future<void> setFirstTimeLogin(bool isFirst) async {
    final pref = await StreamingSharedPreferences.instance;
    pref.setBool(prefLogin, isFirst);
  }
}
