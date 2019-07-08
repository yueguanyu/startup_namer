import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startup_namer/screens/big_bloc/index.dart';

class BigBlocScreen extends StatefulWidget {
  const BigBlocScreen({
    Key key,
    @required BigBlocBloc bigBlocBloc,
  })  : _bigBlocBloc = bigBlocBloc,
        super(key: key);

  final BigBlocBloc _bigBlocBloc;

  @override
  BigBlocScreenState createState() {
    return new BigBlocScreenState(_bigBlocBloc);
  }
}

class BigBlocScreenState extends State<BigBlocScreen> {
  final BigBlocBloc _bigBlocBloc;
  BigBlocScreenState(this._bigBlocBloc);

  @override
  void initState() {
    super.initState();
    this._bigBlocBloc.dispatch(LoadBigBlocEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BigBlocEvent, BigBlocState>(
        bloc: widget._bigBlocBloc,
        builder: (
          BuildContext context,
          BigBlocState currentState,
        ) {
          if (currentState is UnBigBlocState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorBigBlocState) {
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
