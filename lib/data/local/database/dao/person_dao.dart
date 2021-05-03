import 'package:floor/floor.dart';
import 'package:flutter_base_by_minhnv/data/local/database/entity/person.dart';

@dao
abstract class PersonDao {
  @Query("SELECT * FROM Person")
  Future<List<Person>> findAllPerson();

  @insert
  Future<void> insertPerson(Person person);
}