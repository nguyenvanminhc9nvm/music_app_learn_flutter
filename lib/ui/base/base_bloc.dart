import 'package:flutter/cupertino.dart';
import 'package:flutter_base_by_minhnv/application.dart';
import 'package:flutter_base_by_minhnv/data/model/api/base_response.dart';
import 'package:rxdart/subjects.dart';

typedef AsyncCallback<T> = Function(T);

abstract class BaseBloc {
  final progressBar = PublishSubject<bool>();
  final trackingError = PublishSubject<String>();
  final dataManager = Application().dataManager;

  void coroutineScope<T>(Future<T> asyncCallback, AsyncCallback<T> response,
      {bool isShowLoading = true}) async {
    void showLoading({required bool isShow}) {
      if (!isShowLoading) return;
      progressBar.add(isShow);
    }

    showLoading(isShow: true);
    try {
      var result = await asyncCallback;
      showLoading(isShow: false);
      response(result);
    } catch (ex) {
      showLoading(isShow: false);
      print("error $ex");
      if (ex is ErrorMessage) {
        trackingError.add(ex.errorMessage ?? "default message");
      }
    }
  }

}
class BlocProvider<T extends BaseBloc> extends StatefulWidget {
  BlocProvider({
    Key? key,
    required this.child,
    required this.bloc,
  }) : super(key: key);
  final Widget child;
  final T bloc;

  @override
  _BlocProviderState<T> createState() {
    return _BlocProviderState();
  }

  static T of<T extends BaseBloc>(BuildContext context) {
    final _BlocProviderInherited<T>? blocProvider = context
        .getElementForInheritedWidgetOfExactType<_BlocProviderInherited<T>>()
        ?.widget as _BlocProviderInherited<T>?;
    // var block = context.dependOnInheritedWidgetOfExactType<_BlocProviderInherited<T>>();
    return blocProvider!.bloc;
  }
}

class _BlocProviderState<T extends BaseBloc> extends State<BlocProvider<T>> {
  @override
  Widget build(BuildContext context) {
    return _BlocProviderInherited(child: widget.child, bloc: widget.bloc);
  }
}

class _BlocProviderInherited<T extends BaseBloc> extends InheritedWidget {
  _BlocProviderInherited({
    Key? key,
    required Widget child,
    required this.bloc,
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) {
    return false;
  }
}
