import 'package:flutter_base_by_minhnv/data/local/database/entity/person.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class AddPersonBloc extends BaseBloc {
  //input
  BehaviorSubject<String> id = BehaviorSubject();
  BehaviorSubject<String> name = BehaviorSubject();
  PublishSubject<bool> triggerAddTask = PublishSubject();

  Function(String) get idChange => id.add;

  Function(String) get nameChange => name.add;

  //output
  PublishSubject<bool> isAddSuccess = PublishSubject();

  AddPersonBloc() {
    triggerAddTask
        .map((event) {
          return Person(null, name.value ?? "default name");
        })
        .switchMap((value) => dataManager.insertPerson(value))
        .listen((event) {
          isAddSuccess.add(true);
        })
        .addTo(compositeSubscription);
  }

  @override
  void dispose() {
    id.close();
    name.close();
    triggerAddTask.close();
    isAddSuccess.close();
    super.dispose();
  }
}
