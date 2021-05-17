import 'package:floor/floor.dart';

@entity
class Person {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;

  var isChecked = false;

  Person(this.id, this.name);

  void setChecked(bool? checked) {
    if (checked != null) {
      isChecked = checked;
    }
  }
}