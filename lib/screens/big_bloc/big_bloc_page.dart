import 'package:flutter/material.dart';
import 'package:startup_namer/screens/big_bloc/index.dart';

class BigBlocPage extends StatelessWidget {
  static const String routeName = "/bigBloc";

  @override
  Widget build(BuildContext context) {
    var _bigBlocBloc = new BigBlocBloc();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BigBloc"),
      ),
      body: new BigBlocScreen(bigBlocBloc: _bigBlocBloc),
    );
  }
}
