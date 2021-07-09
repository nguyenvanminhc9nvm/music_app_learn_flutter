import 'package:flutter_base_by_minhnv/data/model/local/latest_trends_model.dart';
import 'package:flutter_base_by_minhnv/data/model/local/model_trend.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LatestTrendsBloc extends BaseBloc {
  BehaviorSubject<ModelTrend> latestTrends = BehaviorSubject();

  LatestTrendsBloc() {
    dataManager.doLoadLatestTrend().then((value) => latestTrends.add(value));
  }
}