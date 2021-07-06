import 'package:flutter_base_by_minhnv/ui/base/base_bloc.dart';

class BlockProviderFactory {
  B createBlocClass<B extends BaseBloc>(Type type) {
    switch (type) {
      default:
        throw "Unknown block class: $type";
    }
  }
}