import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../base/base_state.dart';
import 'artists/artists.dart';
import 'categories/categories.dart';
import 'features/features.dart';
import 'latest_trends/latest_trends.dart';
import 'main_bloc.dart';
import 'songs/song.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends BaseState<MainScreen, MainBloc>
    with SingleTickerProviderStateMixin {
  String _titleAppBarKey = "lt_title";
  bool isShowLeading = true;
  ScrollController _controller = ScrollController();
  late TabController _tabController;
  int _selectedIndex = 2;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
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
                titlePadding:
                    EdgeInsetsDirectional.fromSTEB(20.sp, 60.sp, 0, 20),
              ),
            ),
          ];
        },
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: _pages,
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
    );
  }

  @override
  void onListenerStream() {

  }

  Text _titleAppBar() => Text(
    getString(_titleAppBarKey),
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

  final _pages = [Artists(), Song(), LatestTrends(), Features(), Categories()];

  LinearGradient _itemBottomBarColor() => LinearGradient(
        colors: <Color>[
          Color.fromRGBO(238, 9, 121, 1),
          Color.fromRGBO(255, 106, 0, 1),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        backgroundColor: isDarkMode() ? Colors.black : Colors.white,
        showUnselectedLabels: true,
        onTap: (int index) => setState(() => _onTapBottomItem(index)),
        currentIndex: selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: GradientIcon(
                Icons.all_inclusive,
                20,
                _itemBottomBarColor(),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: GradientIcon(
                Icons.mic_rounded,
                20,
                _itemBottomBarColor(),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: isDarkMode()
                      ? LinearGradient(
                          colors: <Color>[
                            Colors.black,
                            Colors.black,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : _itemBottomBarColor(),
                ),
                child: GradientIcon(
                  Icons.wifi_tethering,
                  40,
                  isDarkMode()
                      ? _itemBottomBarColor()
                      : LinearGradient(
                          colors: <Color>[
                            Colors.white,
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                ),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: GradientIcon(
                Icons.album_outlined,
                20,
                _itemBottomBarColor(),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: GradientIcon(
                Icons.settings,
                20,
                _itemBottomBarColor(),
              ),
              label: ""),
        ],
      );

  _onTapBottomItem(index) {
    _selectedIndex = index;
    _tabController.animateTo(_selectedIndex);
    switch (index) {
      case 0:
        return _titleAppBarKey = "ar_title";
      case 1:
        return _titleAppBarKey = "song_title";
      case 2:
        return _titleAppBarKey = "lt_title";
      case 3:
        return _titleAppBarKey = "ft_title";
      case 4:
        return _titleAppBarKey = "ct_title";
    }
  }
}

extension Range on num {
  bool isRange(num from, num to) {
    return from < this && this < to;
  }
}

class GradientIcon extends StatelessWidget {
  GradientIcon(
    this.icon,
    this.size,
    this.gradient,
  );

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}