import 'package:flutter_base_by_minhnv/data/data_manager.dart';
import 'package:flutter_base_by_minhnv/data/local/database/app_database/app_db_helper.dart';
import 'package:flutter_base_by_minhnv/data/local/database/app_database/db_helper.dart';
import 'package:flutter_base_by_minhnv/data/local/database/entity/person.dart';
import 'package:flutter_base_by_minhnv/data/local/pref/app_preferences.dart';
import 'package:flutter_base_by_minhnv/data/local/pref/preferences.dart';
import 'package:flutter_base_by_minhnv/data/model/api/base_response.dart';
import 'package:flutter_base_by_minhnv/data/model/api/list_response.dart';
import 'package:flutter_base_by_minhnv/data/model/api/login/sign_in_response.dart';
import 'package:flutter_base_by_minhnv/data/model/on_boarding.dart';
import 'package:flutter_base_by_minhnv/data/remote/app_api_helper.dart';
import 'package:flutter_base_by_minhnv/data/remote/api_helper.dart';
import 'package:flutter_base_by_minhnv/utils/constant/constant.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class AppDataManager extends DataManager {
  static final AppDataManager _singleton = AppDataManager.internal();

  factory AppDataManager() {
    return _singleton;
  }

  late ApiHelper _apiHelper;
  late Preferences _preferences;
  late DbHelper _dbHelper;

  AppDataManager.internal() {
    _apiHelper = AppApiHelper();
    _preferences = AppPreferences();
    _dbHelper = AppDbHelper();
  }

  @override
  Future<void> saveToken(String? token) => _preferences.saveToken(token);

  @override
  Stream<String> getToken() {
    return _preferences.getToken();
  }

  @override
  Future<bool> getFirstTimeLogin() {
    return _preferences.getFirstTimeLogin();
  }

  @override
  Future<void> setFirstTimeLogin(bool isFirst) {
    return _preferences.setFirstTimeLogin(isFirst);
  }

  @override
  Future<BaseResponse<SignInResponse>> doLogin(String username, String pass) {
    return _apiHelper.doLogin(username, pass);
  }

  @override
  Stream<BaseResponse<List<Product>>> doGetList() {
    return _apiHelper.doGetList();
  }

  @override
  Future<List<Person>> findAllPerson() {
    return _dbHelper.findAllPerson();
  }

  @override
  Stream<bool> insertPerson(Person person) {
    return _dbHelper.insertPerson(person);
  }
}
