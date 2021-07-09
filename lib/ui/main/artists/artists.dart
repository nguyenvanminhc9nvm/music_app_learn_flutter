import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_state.dart';
import 'package:flutter_base_by_minhnv/ui/main/artists/artists_bloc.dart';

class Artists extends StatefulWidget {
  const Artists({Key? key}) : super(key: key);

  @override
  _ArtistsState createState() => _ArtistsState();
}

class _ArtistsState extends BaseState<Artists, ArtistsBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("artists"),
      ),
    );
  }

  @override
  void onListenerStream() {
    // TODO: implement onListenerStream
  }
}
