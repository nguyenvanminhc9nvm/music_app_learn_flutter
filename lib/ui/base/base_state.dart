import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_by_minhnv/application.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_bloc.dart';

abstract class BaseState<W extends StatefulWidget, B extends BaseBloc>
    extends State<W> {
  String titleScreen();

  Widget? createBodyWidget();

  late B bloc;
  late BuildContext mContext;
  final blocFactory = Application().blockProviderFactory;

  void onListenerStream();

  @override
  void initState() {
    bloc = blocFactory.createBlocClass(B);
    onListenerStream();
    bloc.progressBar.listen((value) {
      if (value) {
        showLoading();
      }
    });
    bloc.trackingError.listen((value) {
      if (value.isEmpty) {
        return;
      }
      showMyDialog(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleScreen()),
      ),
      body: BlocProvider(
        child: createBodyWidget()!,
        bloc: bloc,
      ),
    );
  }

  void showLoading() async {
    await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          mContext = context;
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void showMyDialog(String message)  {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Thông báo',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
