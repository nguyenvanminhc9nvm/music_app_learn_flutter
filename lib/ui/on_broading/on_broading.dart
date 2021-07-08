import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base_by_minhnv/data/model/local/on_boarding.dart';
import 'package:flutter_base_by_minhnv/ui/on_broading/on_broading_bloc.dart';
import 'package:flutter_base_by_minhnv/utils/constant/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../base/base_state.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends BaseState<OnBoarding, OnBoardingBloc> {
  bool _changeOb = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: isDarkMode()
              ? LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[
                    Color.fromRGBO(254, 103, 4, 1),
                    Color.fromRGBO(239, 13, 116, 1)
                  ], // red to yellow
                )
              : LinearGradient(
                  colors: <Color>[Colors.white, Colors.white], // red to yellow
                ),
        ),
        child: StreamBuilder<OnBoardings>(
          stream: bloc.onBoarding,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              OnBoardings onBoardings = snapshot.data as OnBoardings;
              return Column(
                children: [
                  _buildImageBgOb(onBoardings),
                  _buildTitleOb(onBoardings),
                  _buildArticleOb(onBoardings),
                  _buildBtnChangeOb(),
                  _buildBtnSkip()
                ],
              );
            }
            return Text("no data");
          },
        ),
      ),
    );
  }

  Expanded _buildImageBgOb(OnBoardings onBoardings) => Expanded(
        flex: 6,
        child: isDarkMode()
            ? Image.asset(onBoardings.pathDark)
            : Image.asset(onBoardings.pathLight),
      );

  Expanded _buildTitleOb(OnBoardings onBoardings) => Expanded(
        flex: 1,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            getString(onBoardings.title),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
        ),
      );

  Expanded _buildArticleOb(OnBoardings onBoardings) => Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.sp, 0, 20.sp, 0),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              getString(onBoardings.article),
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w200),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );

  Expanded _buildBtnChangeOb() {
    Color _bgColorBtn;
    Color _bgIconBtn;
    if(_changeOb){
      _bgColorBtn = isDarkMode() ? Colors.white : Color.fromRGBO(255, 17, 104, 1);
      _bgIconBtn = isDarkMode() ? Color.fromRGBO(254, 103, 4, 1) : Colors.white;
    } else {
      _bgColorBtn = isDarkMode() ? Color.fromRGBO(254, 103, 4, 1) : Colors.white;
      _bgIconBtn = isDarkMode() ? Colors.white : Colors.black;
    }

    SizedBox _buildButton(IconData icon, int element) => SizedBox(
          width: 65.sp,
          height: 65.sp,
          child: ElevatedButton(
            onPressed: () {
              bloc.changeObjOb(element);
              setState(() {
                _changeOb = !_changeOb;
              });
            },
            child: Icon(
              icon,
              size: 40,
              color: _bgIconBtn,
            ),
            style: ElevatedButton.styleFrom(
              primary: _bgColorBtn,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(
                  color: isDarkMode() ? Colors.white : Colors.black,
                  width: 1,
                ),
              ),
            ),
          ),
        );
    return Expanded(
      flex: 2,
      child: Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            Spacer(),
            Expanded(
              flex: 1,
              child: _buildButton(Icons.wifi_tethering, 0),
            ),
            Padding(
              padding: EdgeInsets.all(10.sp),
            ),
            Expanded(
              flex: 1,
              child: _buildButton(Icons.favorite, 1),
            ),
            Padding(
              padding: EdgeInsets.all(10.sp),
            ),
            Expanded(
              flex: 1,
              child: _buildButton(Icons.music_note, 2),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Expanded _buildBtnSkip() => Expanded(
        child: InkWell(
          onTap: () {
            bloc.skip();
          },
          child: Text(
            "SKIP",
            style: TextStyle(fontSize: 15.sp),
          ),
        ),
      );

  @override
  void onListenerStream() {
    bloc.moveToMain.listen((value) {
      Navigator.pushReplacementNamed(context, mainScreen);
    });
  }
}

