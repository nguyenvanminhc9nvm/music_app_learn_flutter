import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_state.dart';
import 'package:flutter_base_by_minhnv/ui/main/features/features_bloc.dart';

class Features extends StatefulWidget {
  const Features({Key? key}) : super(key: key);

  @override
  _FeaturesState createState() => _FeaturesState();
}

class _FeaturesState extends BaseState<Features, FeaturesBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Features"),
      ),
    );
  }

  @override
  void onListenerStream() {
    // TODO: implement onListenerStream
  }
}
