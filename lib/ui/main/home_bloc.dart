import 'package:flutter_base_by_minhnv/data/model/api/list_response.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BaseBloc {
  BehaviorSubject<List<Product>> products = BehaviorSubject();

  void triggerGetList() {
    dataManager.doGetList().listen((event) {
      if (event.isSuccess() && event.data != null) {
        products.add(event.data!);
      }
    });
  }
}