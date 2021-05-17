import 'package:flutter_base_by_minhnv/data/local/database/entity/person.dart';

abstract class DbHelper {
  Future<List<Person>> findAllPerson();

  Stream<bool> insertPerson(Person person);
}