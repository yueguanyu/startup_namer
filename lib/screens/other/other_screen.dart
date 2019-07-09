import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startup_namer/screens/other/index.dart';

class OtherScreen extends StatefulWidget {
  const OtherScreen({
    Key key,
    @required OtherBloc otherBloc,
  })  : _otherBloc = otherBloc,
        super(key: key);

  final OtherBloc _otherBloc;

  @override
  OtherScreenState createState() {
    return new OtherScreenState(_otherBloc);
  }
}

class OtherScreenState extends State<OtherScreen> {
  final OtherBloc _otherBloc;
  OtherScreenState(this._otherBloc);

  @override
  void initState() {
    super.initState();
    this._otherBloc.dispatch(LoadOtherEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherEvent, OtherState>(
        bloc: widget._otherBloc,
        builder: (
          BuildContext context,
          OtherState currentState,
        ) {
          if (currentState is UnOtherState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorOtherState) {
            return new Container(
              child: new Center(
              child: new Text(currentState.errorMessage ?? 'Error' ),
            ));
          }
          return new Container(
              child: new Center(
            child: new Text("В разработке"),
          ));
        });
  }
}
