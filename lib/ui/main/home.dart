import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_by_minhnv/data/model/api/list_response.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_state.dart';
import 'package:flutter_base_by_minhnv/ui/main/add_person/add_person.dart';
import 'package:flutter_base_by_minhnv/ui/main/home_bloc.dart';
import 'package:flutter_base_by_minhnv/ui/main/view_person/view_person.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends BaseState<HomeScreen, HomeBloc> {
  @override
  Widget? createBodyWidget() => null;

  @override
  void onListenerStream() {}

  @override
  String titleScreen() => '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: ElevatedButton(
                    onPressed: () {
                      bloc.triggerGetList();
                    },
                    child: Text("get"))),
            Expanded(
              flex: 9,
              child: StreamBuilder<List<Product>>(
                stream: bloc.products,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Product> products = snapshot.data as List<Product>;
                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        Product product = products[index];
                        return LimitedBox(
                            maxHeight: 50,
                            child: Text(product.prodContent ?? ""));
                      },
                    );
                  }
                  return Text("no value display");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}