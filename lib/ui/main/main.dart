import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_state.dart';
import 'package:flutter_base_by_minhnv/ui/main/main_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends BaseState<MainScreen, MainBloc> {
  String titleAppBarKey = "lt_title";
  bool isShowLeading = true;
  double _x = 50.sp;
  double _y = 60.sp;
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        controller: _controller,
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 120,
              floating: true,
              stretch: true,
              pinned: true,
              snap: false,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                centerTitle: false,
                title: _titleAppBar(),
                titlePadding: EdgeInsetsDirectional.fromSTEB(40.sp, 60.sp, 0, 20),
              ),
            ),
          ];
        },
        body: Scaffold(
          body: Container(
            child: Text("minhnv"),
          ),
        ),
      ),
    );
  }

  @override
  void onListenerStream() {
    _controller.addListener(() {

    });
  }

  Text _titleAppBar() => Text(
        getString(titleAppBarKey),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
          foreground: Paint()
            ..shader = LinearGradient(
              colors: <Color>[
                Color.fromRGBO(255, 17, 104, 1),
                Color.fromRGBO(254, 103, 4, 1)
              ],
            ).createShader(
              Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
            ),
        ),
      );
}

extension Range on num {
  bool isRange(num from, num to) {
    return from < this && this < to;
  }
}
