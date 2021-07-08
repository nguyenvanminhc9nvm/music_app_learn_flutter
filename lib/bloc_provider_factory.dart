import 'package:flutter_base_by_minhnv/ui/base/base_bloc.dart';
import 'package:flutter_base_by_minhnv/ui/main/artists/artists_bloc.dart';
import 'package:flutter_base_by_minhnv/ui/main/categories/categories_bloc.dart';
import 'package:flutter_base_by_minhnv/ui/main/features/features_bloc.dart';
import 'package:flutter_base_by_minhnv/ui/main/latest_trends/latest_trends_bloc.dart';
import 'package:flutter_base_by_minhnv/ui/main/main_bloc.dart';
import 'package:flutter_base_by_minhnv/ui/main/songs/song_bloc.dart';
import 'package:flutter_base_by_minhnv/ui/on_broading/on_broading_bloc.dart';

import 'ui/splash/splash_bloc.dart';
import 'ui/splash/splash_bloc.dart';

class BlockProviderFactory {
  B createBlocClass<B extends BaseBloc>(Type type) {
    switch (type) {
      case SplashBloc:
        return SplashBloc() as B;
      case OnBoardingBloc:
        return OnBoardingBloc() as B;
      case MainBloc:
        return MainBloc() as B;
      case ArtistsBloc:
        return ArtistsBloc() as B;
      case CategoriesBloc:
        return CategoriesBloc() as B;
      case FeaturesBloc:
        return FeaturesBloc() as B;
      case LatestTrendsBloc:
        return LatestTrendsBloc() as B;
      case SongBloc:
        return SongBloc() as B;
      default:
        throw "Unknown block class: $type";
    }
  }
}