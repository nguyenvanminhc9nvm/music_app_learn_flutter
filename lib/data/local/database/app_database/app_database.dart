import 'package:floor/floor.dart';
import 'package:flutter_base_by_minhnv/data/local/database/dao/person_dao.dart';
import 'package:flutter_base_by_minhnv/data/local/database/entity/person.dart';

import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [Person])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
}