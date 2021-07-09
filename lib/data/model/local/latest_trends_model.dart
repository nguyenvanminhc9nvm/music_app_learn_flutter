import 'package:flutter_base_by_minhnv/data/model/local/trending.dart';

class LatestTrendModel {
  final String imageUrl;
  final String name;
  final int countHasTag;
  final List<UserTakingCare> users;

  LatestTrendModel(this.imageUrl, this.name, this.countHasTag, this.users);
}

class UserTakingCare {
  final String imageUrl;

  UserTakingCare(this.imageUrl);
}
