import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constant/constant.dart';
import '../../utils/constant/constant.dart';
import '../base/base_state.dart';
import 'splash_bloc.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends BaseState<Splash, SplashBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isDarkMode()
                ? Image.asset(
                    iconAppDark,
                    width: 200.sp,
                    height: 290.sp,
                  )
                : Image.asset(
                    iconAppLight,
                    width: 200.sp,
                    height: 290.sp,
                  ),
            Text(
              getString("name_app"),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onListenerStream() {
    bloc.checkFirstTimeSignIn();
    bloc.firstTimeSignIn.listen((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, mainScreen);
      } else {
        Navigator.pushReplacementNamed(context, onBoarding);
      }
    });
  }
}
