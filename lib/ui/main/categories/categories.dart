import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_state.dart';
import 'package:flutter_base_by_minhnv/ui/main/categories/categories_bloc.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends BaseState<Categories, CategoriesBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Categories"),
      ),
    );
  }

  @override
  void onListenerStream() {
    // TODO: implement onListenerStream
  }
}
