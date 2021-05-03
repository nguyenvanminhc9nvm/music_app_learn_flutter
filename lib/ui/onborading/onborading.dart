import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_by_minhnv/data/model/on_boarding.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_state.dart';
import 'package:flutter_base_by_minhnv/ui/error/error_404.dart';
import 'package:flutter_base_by_minhnv/ui/onborading/onborading_bloc.dart';
import 'package:flutter_base_by_minhnv/utils/constant/constant.dart';
import 'package:flutter_base_by_minhnv/utils/localize/AppLocalization.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OnBoardingState();
  }
}

class _OnBoardingState extends BaseState<OnBoardingScreen, OnBoardingBloc> {
  final _controller = PageController(initialPage: 0);

  @override
  Widget? createBodyWidget() {
    return null;
  }

  @override
  void onListenerStream() {
    // TODO: implement onListenerStream
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: StreamBuilder<List<OnBoarding>>(
          stream: bloc.onBoardings,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final onBoarding = snapshot.data as List<OnBoarding>;
              return PageView(
                controller: _controller,
                children: [
                  Column(
                    children: [
                      _createBannerView(onBoarding.elementAt(0)),
                      _createArticleView(onBoarding.elementAt(0)),
                      _createFooterView(snapshot.data as List<OnBoarding>)
                    ],
                  ),
                  Column(
                    children: [
                      _createBannerView(onBoarding.elementAt(1)),
                      _createArticleView(onBoarding.elementAt(1)),
                      _createFooterView(snapshot.data as List<OnBoarding>)
                    ],
                  ),
                  Column(
                    children: [
                      _createBannerView(onBoarding.elementAt(2)),
                      _createArticleView(onBoarding.elementAt(2)),
                      _createFooterView(snapshot.data as List<OnBoarding>)
                    ],
                  ),
                ],
              );
            }
            return Error404Screen();
          }),
    );
  }

  @override
  String titleScreen() {
    return "";
  }

  Expanded _createBannerView(OnBoarding onBoarding) {
    return Expanded(
      flex: 5,
      child: Image(
        image: AssetImage(onBoarding.imgUrl),
        height: 300,
      ),
    );
  }

  Expanded _createArticleView(OnBoarding onBoarding) {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          Text(
            onBoarding.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(118.0, 50, 118.0, 0),
            child: Text(
              onBoarding.article,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _createFooterView(List<OnBoarding> onBoardings) {
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          Expanded(
            child: TextButton(onPressed: onSkipClick, child: Text("skip")),
          ),
          Expanded(
            child: DotsIndicator(dotsCount: onBoardings.length),
          ),
          Expanded(
            child: TextButton(onPressed: onNextClick, child: Text("Next")),
          ),
        ],
      ),
    );
  }

  void onSkipClick() {
    Navigator.pushReplacementNamed(context, AppConstant.loginScreen);
  }

  void onNextClick() {
    _controller.animateToPage(_controller.page!.toInt() + 1,
        duration: Duration(microseconds: 200),
        curve: Curves.easeIn);
  }
}
