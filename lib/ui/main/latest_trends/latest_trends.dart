import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base_by_minhnv/data/model/local/model_trend.dart';
import 'package:flutter_base_by_minhnv/data/model/local/trending.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/local/latest_trends_model.dart';
import '../../base/base_state.dart';
import 'latest_trends_bloc.dart';

class LatestTrends extends StatefulWidget {
  const LatestTrends({Key? key}) : super(key: key);

  @override
  _LatestTrendsState createState() => _LatestTrendsState();
}

class _LatestTrendsState extends BaseState<LatestTrends, LatestTrendsBloc> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<ModelTrend>(
        stream: bloc.latestTrends,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ModelTrend trend = snapshot.data as ModelTrend;
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: trend.latestTrends.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: 2500.h,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 350.h,
                          child: Container(
                            height: 316.sp,
                            color: gradient1,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: trend.trends.length,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 10.sp),
                                    child: Center(
                                      child: Text(
                                        "Trending\nNow",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  );
                                } else {
                                  return _buildItemTrend(trend.trends[index]);
                                }
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          child: _buildItemLatestTrend(trend.latestTrends[0]),
                        ),
                        Positioned(
                          top: 10,
                          child: _buildItemLatestTrend(trend.latestTrends[0]),
                        ),
                      ],
                    ),
                  );
                } else {
                  return _buildItemLatestTrend(trend.latestTrends[index]);
                }
              },
            );
          }
          return Text("no data");
        },
      ),
    );
  }

  Container _buildItemTrend(Trending trending) {
    return Container(
      width: 130.w,
      height: 130.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            width: 130.w,
            child: Image.asset(
              trending.imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 20,
            top: 170,
            child: Text(
              trending.name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildItemLatestTrend(LatestTrendModel latestTrendModel) {
    return Container(
      margin: EdgeInsets.fromLTRB(25.w, 0, 20.w, 25.h),
      height: 400.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 5.w,
            child: Image.asset(latestTrendModel.imageUrl),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
          ),
          Positioned(
            right: 24.sp,
            child: Container(
              width: 65.sp,
              height: 65.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  colors: <Color>[
                    gradient1,
                    gradient2,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Icon(
                Icons.account_tree_sharp,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          Positioned(
            left: 20.sp,
            top: 233.sp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  latestTrendModel.name,
                  style: TextStyle(
                      fontSize: 36.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "${latestTrendModel.countHasTag} #hashtag",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 46.sp,
            left: 20.sp,
            child: Container(
              width: 300.sp,
              height: 30.sp,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Positioned(
                    top: 0,
                    child: ClipOval(
                      child: Image.asset(latestTrendModel.users[0].imageUrl),
                    ),
                  ),
                  Positioned(
                    left: 2,
                    child: ClipOval(
                      child: Image.asset(latestTrendModel.users[1].imageUrl),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    child: ClipOval(
                      child: Image.asset(latestTrendModel.users[2].imageUrl),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    child: Text(
                      "${latestTrendModel.users.length} are talking about this",
                      style: TextStyle(
                          fontWeight: FontWeight.w200, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildItemTrending(List<Trending> trending) {
    return Container();
  }

  @override
  void onListenerStream() {
    // TODO: implement onListenerStream
  }
}
