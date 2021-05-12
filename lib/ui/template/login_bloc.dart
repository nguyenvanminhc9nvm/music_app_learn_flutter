import 'package:flutter_base_by_minhnv/data/model/api/base_response.dart';
import 'package:flutter_base_by_minhnv/data/model/api/login/sign_in_response.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_bloc.dart';
import 'package:rxdart/subjects.dart';

class LoginBloc extends BaseBloc {
  final _loginSuccess = PublishSubject<bool>();
  Stream<bool> get loginSuccess => _loginSuccess;

  final PublishSubject _triggerClick = PublishSubject<bool>();

  LoginBloc() {
    _triggerClick.listen((value) {

    });
  }

  Future<void> doLogin(String username, String pass) async {
    final reponse = await dataManager.doLogin(username, pass);
    if (reponse.isSuccess()) {
      await dataManager.saveToken(reponse.data?.accessToken);
      _loginSuccess.add(true);
    } else {
      trackingError.add(reponse.error?.errorMessage ?? "default error");
    }
  }
}