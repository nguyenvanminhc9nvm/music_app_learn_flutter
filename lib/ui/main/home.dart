import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_state.dart';
import 'package:flutter_base_by_minhnv/ui/main/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends BaseState<HomeScreen, HomeBloc> {
  @override
  Widget? createBodyWidget() {
    // TODO: implement createBodyWidget
    throw UnimplementedError();
  }

  @override
  void onListenerStream() {
    // TODO: implement onListenerStream
  }

  @override
  String titleScreen() {
    // TODO: implement titleScreen
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Text("Home"),
      ),
    );
  }
}