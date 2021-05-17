import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_bloc.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_state.dart';
import 'package:flutter_base_by_minhnv/ui/main/add_person/add_person_bloc.dart';

class AddPerson extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddPersonState();
  }
}

class _AddPersonState extends BaseState<AddPerson, AddPersonBloc> {
  @override
  Widget? createBodyWidget() => null;

  @override
  void onListenerStream() {
    bloc.isAddSuccess.listen((value) {
      print("pop");
      Navigator.of(context).pop();
    });
  }

  @override
  String titleScreen() => "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        bloc: bloc,
        child: Container(
          margin: EdgeInsets.all(10),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "Add Task",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Expanded(flex: 6, child: _addPersonInput()),
                Spacer(
                  flex: 3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _addPersonInput() => Container(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: TextFormField(
                onChanged: (value) {
                  bloc.idChange(value);
                },
                decoration: InputDecoration(
                  labelText: 'Label text',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: TextFormField(
                onChanged: (value) {
                  bloc.nameChange(value);
                },
                decoration: InputDecoration(
                  labelText: 'Label text',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("submit"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () => bloc.triggerAddTask.add(true),
                ),
              ),
            ),
          ],
        ),
      );
}
