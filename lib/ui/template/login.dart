import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_state.dart';
import 'package:flutter_base_by_minhnv/ui/template/login_bloc.dart';
import 'package:flutter_base_by_minhnv/utils/constant/constant.dart';
import 'package:flutter_base_by_minhnv/utils/extension/extension.dart';
import 'package:flutter_base_by_minhnv/utils/localize/AppLocalization.dart';
import 'package:http/http.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends BaseState<LoginScreen, LoginBloc> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget? createBodyWidget() {
    // TODO: implement createBodyWidget
    return null;
  }

  @override
  void onListenerStream() {
    bloc.loginSuccess.listen((event) {
        Navigator.pushReplacementNamed(context, AppConstant.homeScreen);
    });
  }

  @override
  String titleScreen() {
    return '';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              _expHeader(),
              _expEmailInp(),
              _expPasswordInp(),
              _expCheckboxRemember(),
              _expButtonLogin(),
              _expOptionSignIn()
            ],
          ),
        ),
      ),
    );
  }

  Expanded _expHeader() {
    return Expanded(
        flex: 2,
        child: Center(
            child: Text(
          getString("title_sign_in"),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        )));
  }

  Expanded _expEmailInp() {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 20, 5),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                getString("label_email"),
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    )),
                Expanded(
                  flex: 8,
                  child: TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: getString("hint_pass"),
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Expanded _expPasswordInp() {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 20, 5),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                getString("label_password"),
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                    )),
                Expanded(
                  flex: 8,
                  child: TextFormField(
                    controller: _passwordController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: getString("hint_pass"),
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Expanded _expCheckboxRemember() {
    return Expanded(
      flex: 1,
      child: CheckboxListTile(
        title: Text(
          getString("label_checked_member"),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        value: true,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool? value) {},
      ),
    );
  }

  Container _expButtonLogin() {
    return Container(
        child: ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 300, height: 50),
      child: ElevatedButton(
        onPressed: triggerLogin,
        child: Text(
          getString("label_login"),
          style: TextStyle(color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0))),
      ),
    ));
  }

  Expanded _expOptionSignIn() {
    return Expanded(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Text(
                    "-- ${getString("label_or")} --",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    getString("label_option_sign_in"),
                    style: TextStyle(color: Colors.white),
                  )),
              Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Spacer(flex: 2,),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.event,
                            color: Colors.black,
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0))),
                        ),
                      ),
                      Spacer(flex: 2,),
                      Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0))),
                            child: Icon(Icons.api_rounded, color: Colors.black),
                          )),
                      Spacer(flex: 2,),
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Text(getString("label_dnt_have_acc")),
                      Text(getString("label_sign_up")),
                    ],
                  )),
            ],
          ),
        ));
  }

  void triggerLogin() {
    bloc.doLogin(_emailController.text, _passwordController.text);
  }
}
