import 'package:flutter_base_by_minhnv/data/model/local/on_boarding.dart';
import 'package:rxdart/rxdart.dart';

import '../base/base_bloc.dart';

class OnBoardingBloc extends BaseBloc {
  BehaviorSubject<OnBoardings> onBoarding = BehaviorSubject();
  BehaviorSubject<bool> moveToMain = BehaviorSubject();

  OnBoardingBloc() {
    dataManager.doLoadListOb().then((value) => onBoarding.add(value[0]));
  }

  void changeObjOb(int elementSelected) {
    dataManager
        .doLoadListOb()
        .then((value) => onBoarding.add(value[elementSelected]));
  }

  void skip() {
    dataManager.setFirstTimeLogin(true);
    moveToMain.add(true);
  }
}
