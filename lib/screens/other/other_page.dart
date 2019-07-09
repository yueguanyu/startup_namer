import 'package:flutter/material.dart';
import 'package:startup_namer/screens/other/index.dart';

class OtherPage extends StatelessWidget {
  static const String routeName = "/other";

  @override
  Widget build(BuildContext context) {
    var _otherBloc = new OtherBloc();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Other"),
      ),
      body: new OtherScreen(otherBloc: _otherBloc),
    );
  }
}
