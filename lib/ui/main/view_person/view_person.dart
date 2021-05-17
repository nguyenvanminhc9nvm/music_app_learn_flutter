import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_by_minhnv/data/local/database/entity/person.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_bloc.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_state.dart';
import 'package:flutter_base_by_minhnv/ui/main/view_person/view_person_bloc.dart';
import 'package:flutter_base_by_minhnv/utils/constant/constant.dart';

class ViewPerson extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ViewPersonState();
  }
}

class _ViewPersonState extends BaseState<ViewPerson, ViewPersonBloc> {
  @override
  Widget? createBodyWidget() => null;

  @override
  void onListenerStream() {
    // TODO: implement onListenerStream
  }

  @override
  String titleScreen() => "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlocProvider(
        bloc: bloc,
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: _ViewPersonHeaderWidget(),
                ),
                Expanded(flex: 8, child: _ViewPersonArticleWidget())
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppConstant.addPerson);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ViewPersonHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ViewPersonBloc bloc = BlocProvider.of(context);
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: Text(
              "My Task",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Expanded(
            child: Text(
              "1 of 2",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class _ViewPersonArticleWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ViewPersonArticleState();
  }
}

class _ViewPersonArticleState extends State<_ViewPersonArticleWidget> {
  @override
  Widget build(BuildContext context) {
    ViewPersonBloc bloc = BlocProvider.of(context);
    return Container(
      child: StreamBuilder<List<Person>>(
        stream: bloc.persons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Person> persons = snapshot.data as List<Person>;
            return ListView.builder(
              itemCount: persons.length,
              itemBuilder: (context, index) {
                Person product = persons[index];
                return LimitedBox(
                  maxHeight: 50,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 8,
                            child: Column(
                              children: [
                                Text(
                                  product.id.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  product.name,
                                  style: TextStyle(decorationThickness: 1.0),
                                )
                              ],
                            )),
                        Expanded(
                          flex: 1,
                          child: Checkbox(
                            tristate: false,
                            value: product.isChecked,
                            onChanged: (value) {
                              setState(() {
                                print("product id: ${product.id}");
                                product.setChecked(value);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Text("no value display");
        },
      ),
    );
  }
}
