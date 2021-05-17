import 'package:flutter_base_by_minhnv/data/local/database/entity/person.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class ViewPersonBloc extends BaseBloc {
  BehaviorSubject<List<Person>> persons = BehaviorSubject();

  BehaviorSubject<bool> checkBoxController = BehaviorSubject();

  void setCheckBox(bool? isChecked) {
    if (isChecked != null) {
      checkBoxController.add(isChecked);
    }
  }

  ViewPersonBloc() {
    checkBoxController.add(false);
    dataManager.findAllPerson().then((event) {
      persons.add(event);
    });
  }
}