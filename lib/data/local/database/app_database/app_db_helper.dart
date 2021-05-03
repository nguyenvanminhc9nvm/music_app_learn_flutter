import 'package:floor/floor.dart';
import 'package:flutter_base_by_minhnv/data/local/database/app_database/app_database.dart';
import 'package:flutter_base_by_minhnv/data/local/database/app_database/db_helper.dart';

class AppDbHelper extends DbHelper {
  static final AppDbHelper _singleton = AppDbHelper.internal();

  final database = $FloorAppDatabase.databaseBuilder("database_name").build();

  AppDbHelper.internal();

  factory AppDbHelper() {
    return _singleton;
  }
}
