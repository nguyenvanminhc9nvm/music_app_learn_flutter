import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_state.dart';
import 'package:flutter_base_by_minhnv/ui/splash/splash_bloc.dart';
import 'package:flutter_base_by_minhnv/utils/constant/constant.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }
}

class _SplashState extends BaseState<SplashScreen, SplashBloc> {
  @override
  Widget? createBodyWidget() {
    return null;
  }

  @override
  void onListenerStream() {
    bloc.isFirstTime.listen((event) {
        if (event) {
          print("has login");
          Navigator.pushReplacementNamed(context, AppConstant.onBoardingScreen);
        } else {
          bloc.setFirstTimeLogin(true);
          print("no login");
        }
    });
    bloc.isLogin.listen((event) {
        Navigator.pushReplacementNamed(context, AppConstant.homeScreen);
    });

  }

  @override
  String titleScreen() {
    return "";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text("Splash"),
    );
  }
}