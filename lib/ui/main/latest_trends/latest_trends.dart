import 'package:flutter/widgets.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_state.dart';
import 'package:flutter_base_by_minhnv/ui/main/latest_trends/latest_trends_bloc.dart';

class LatestTrends extends StatefulWidget {
  const LatestTrends({Key? key}) : super(key: key);

  @override
  _LatestTrendsState createState() => _LatestTrendsState();
}

class _LatestTrendsState extends BaseState<LatestTrends, LatestTrendsBloc> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void onListenerStream() {
    // TODO: implement onListenerStream
  }
}
