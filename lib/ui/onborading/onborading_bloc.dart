import 'package:flutter_base_by_minhnv/data/model/on_boarding.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class OnBoardingBloc extends BaseBloc {
  final _onBoardings = PublishSubject<List<OnBoarding>>();
  Stream<List<OnBoarding>> get onBoardings => _onBoardings;

  OnBoardingBloc() {
    dataManager.getListOnBoarding().then((value) =>
      _onBoardings.add(value)
    );
  }
}