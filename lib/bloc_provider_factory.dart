import 'package:flutter_base_by_minhnv/ui/base/base_bloc.dart';

import 'ui/splash/splash_bloc.dart';
import 'ui/splash/splash_bloc.dart';

class BlockProviderFactory {
  B createBlocClass<B extends BaseBloc>(Type type) {
    switch (type) {
      case SplashBloc:
        return SplashBloc() as B;
      default:
        throw "Unknown block class: $type";
    }
  }
}