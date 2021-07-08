import 'package:flutter_base_by_minhnv/data/local/database/app_database/db_helper.dart';
import 'package:flutter_base_by_minhnv/data/local/pref/preferences.dart';
import 'package:flutter_base_by_minhnv/data/model/local/on_boarding.dart';
import 'package:flutter_base_by_minhnv/data/remote/api_helper.dart';

abstract class DataManager implements ApiHelper, Preferences, DbHelper {
  Future<List<OnBoardings>> doLoadListOb();
}