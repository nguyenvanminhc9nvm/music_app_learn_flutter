import 'package:flutter/widgets.dart';
import 'package:flutter_base_by_minhnv/ui/base/base_state.dart';
import 'package:flutter_base_by_minhnv/ui/main/songs/song_bloc.dart';

class Song extends StatefulWidget {
  const Song({Key? key}) : super(key: key);

  @override
  _SongState createState() => _SongState();
}

class _SongState extends BaseState<Song, SongBloc> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void onListenerStream() {
    // TODO: implement onListenerStream
  }
}
