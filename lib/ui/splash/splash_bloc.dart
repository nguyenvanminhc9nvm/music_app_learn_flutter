import 'package:flutter_base_by_minhnv/ui/base/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class SplashBloc extends BaseBloc {
  final _isFirstTime = PublishSubject<bool>();
  Stream<bool> get isFirstTime => _isFirstTime;

  final _isLogin = PublishSubject<bool>();
  Stream<bool> get isLogin => _isLogin;

  SplashBloc() {
    getFirstTimeLogin();
  }

  void getFirstTimeLogin() {
    dataManager.getToken().listen((event) {
      if (event.isNotEmpty) {
        _isLogin.add(true);
      }
    });
  }

  Future<void> setFirstTimeLogin(bool isFirst) async {
    await dataManager.setFirstTimeLogin(isFirst);
  }
}