import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

abstract class Preferences {
  Future<void> saveToken(String? token);

  Stream<String> getToken();

  Future<void> setFirstTimeLogin(bool isFirst);

  Future<bool> getFirstTimeLogin();
}