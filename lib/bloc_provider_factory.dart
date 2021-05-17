import 'package:flutter_base_by_minhnv/ui/base/base_bloc.dart';
import 'package:flutter_base_by_minhnv/ui/main/add_person/add_person_bloc.dart';
import 'package:flutter_base_by_minhnv/ui/main/home_bloc.dart';
import 'package:flutter_base_by_minhnv/ui/main/view_person/view_person_bloc.dart';
import 'package:flutter_base_by_minhnv/ui/onborading/onborading_bloc.dart';
import 'package:flutter_base_by_minhnv/ui/splash/splash_bloc.dart';
import 'package:flutter_base_by_minhnv/ui/template/login_bloc.dart';

class BlockProviderFactory {
  B createBlocClass<B extends BaseBloc>(Type type) {
    switch (type) {
      case SplashBloc:
        return SplashBloc() as B;
      case LoginBloc:
        return LoginBloc() as B;
      case OnBoardingBloc:
        return OnBoardingBloc() as B;
      case HomeBloc:
        return HomeBloc() as B;
      case AddPersonBloc:
        return AddPersonBloc() as B;
      case ViewPersonBloc:
        return ViewPersonBloc() as B;
      default:
        throw "Unknown block class: $type";
    }
  }
}