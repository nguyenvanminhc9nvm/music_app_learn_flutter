import 'package:rxdart/rxdart.dart';

import '../base/base_bloc.dart';

class SplashBloc extends BaseBloc {
  BehaviorSubject<bool> firstTimeSignIn = BehaviorSubject();

  void checkFirstTimeSignIn() {
    dataManager.getFirstTimeLogin().then((value) => firstTimeSignIn.add(value));
  }
}