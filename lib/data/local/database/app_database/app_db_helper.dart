import 'package:floor/floor.dart';
import 'package:flutter_base_by_minhnv/data/local/database/app_database/app_database.dart';
import 'package:flutter_base_by_minhnv/data/local/database/app_database/db_helper.dart';
import 'package:flutter_base_by_minhnv/data/local/database/entity/person.dart';

class AppDbHelper extends DbHelper {
  static final AppDbHelper _singleton = AppDbHelper.internal();

  AppDbHelper.internal();

  factory AppDbHelper() {
    return _singleton;
  }

  @override
  Future<List<Person>> findAllPerson() async {
    final database = await $FloorAppDatabase.databaseBuilder("database_name").build();
    return Future.value(database.personDao.findAllPerson());
  }

  @override
  Stream<bool> insertPerson(Person person) async* {
    final database = await $FloorAppDatabase.databaseBuilder("database_name").build();
    database.personDao.insertPerson(person);
    yield true;
  }
}
