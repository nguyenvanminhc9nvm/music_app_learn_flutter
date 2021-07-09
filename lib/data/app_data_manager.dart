import 'package:flutter_base_by_minhnv/data/data_manager.dart';
import 'package:flutter_base_by_minhnv/data/local/database/app_database/app_db_helper.dart';
import 'package:flutter_base_by_minhnv/data/local/database/app_database/db_helper.dart';
import 'package:flutter_base_by_minhnv/data/local/database/entity/person.dart';
import 'package:flutter_base_by_minhnv/data/local/pref/app_preferences.dart';
import 'package:flutter_base_by_minhnv/data/local/pref/preferences.dart';
import 'package:flutter_base_by_minhnv/data/model/api/base_response.dart';
import 'package:flutter_base_by_minhnv/data/model/api/list_response.dart';
import 'package:flutter_base_by_minhnv/data/model/api/login/sign_in_response.dart';
import 'package:flutter_base_by_minhnv/data/model/local/latest_trends_model.dart';
import 'package:flutter_base_by_minhnv/data/model/local/model_trend.dart';
import 'package:flutter_base_by_minhnv/data/model/local/on_boarding.dart';
import 'package:flutter_base_by_minhnv/data/model/local/trending.dart';
import 'package:flutter_base_by_minhnv/data/remote/api_helper.dart';
import 'package:flutter_base_by_minhnv/data/remote/app_api_helper.dart';
import 'package:flutter_base_by_minhnv/utils/constant/constant.dart';

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

  @override
  Future<List<OnBoardings>> doLoadListOb() {
    List<OnBoardings> list = [
      OnBoardings(icObDarkFirst, icObDarkFirst, "ob_title_1", "ob_article_1"),
      OnBoardings(
          icObDarkSecond, icObLightSecond, "ob_title_2", "ob_article_1"),
      OnBoardings(icObDarkThird, icObLightThird, "ob_title_3", "ob_article_1"),
    ];
    return Future.value(list);
  }

  @override
  Future<ModelTrend> doLoadLatestTrend() {
    List<LatestTrendModel> list = [
      LatestTrendModel(
        icObLightThird,
        "EDM",
        45,
        [
          UserTakingCare(icUser1),
          UserTakingCare(icUser2),
          UserTakingCare(icUser3),
        ],
      ),
      LatestTrendModel(
        icObLightSecond,
        "Indie Rock",
        20,
        [
          UserTakingCare(icUser1),
          UserTakingCare(icUser2),
          UserTakingCare(icUser3),
        ],
      ),
      LatestTrendModel(
        icObLightThird,
        "EDM",
        45,
        [
          UserTakingCare(icUser1),
          UserTakingCare(icUser2),
          UserTakingCare(icUser3),
        ],
      ),
      LatestTrendModel(
        icObDarkFirst,
        "Indie Rock",
        20,
        [
          UserTakingCare(icUser1),
          UserTakingCare(icUser2),
          UserTakingCare(icUser3),
        ],
      ),
      LatestTrendModel(
        icObDarkSecond,
        "EDM",
        45,
        [
          UserTakingCare(icUser1),
          UserTakingCare(icUser2),
          UserTakingCare(icUser3),
        ],
      ),
      LatestTrendModel(
        icObDarkThird,
        "Indie Rock",
        20,
        [
          UserTakingCare(icUser1),
          UserTakingCare(icUser2),
          UserTakingCare(icUser3),
        ],
      ),
    ];

    List<Trending> trends = [
      Trending("Metal", icTrend1),
      Trending("Classical", icTrend2),
      Trending("Metal", icTrend1),
      Trending("Classical", icTrend2),
      Trending("Metal", icTrend1),
      Trending("Classical", icTrend2),
      Trending("Metal", icTrend1),
      Trending("Classical", icTrend2),
      Trending("Metal", icTrend1),
      Trending("Classical", icTrend2),
    ];
    return Future.value(ModelTrend(list, trends));
  }
}
