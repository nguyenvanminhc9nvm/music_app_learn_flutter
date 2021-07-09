import 'package:flutter_base_by_minhnv/data/model/local/latest_trends_model.dart';
import 'package:flutter_base_by_minhnv/data/model/local/trending.dart';

class ModelTrend {
  final List<LatestTrendModel> latestTrends;
  final List<Trending> trends;

  ModelTrend(this.latestTrends, this.trends);
}