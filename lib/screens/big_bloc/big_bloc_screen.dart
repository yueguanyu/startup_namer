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
    return BlocProvider<BigBlocBloc>(
      builder: (BuildContext context) => widget._bigBlocBloc,
      child: BlocBuilder<BigBlocEvent, BigBlocState>(
        bloc: widget._bigBlocBloc,
        builder: (
          BuildContext context,
          BigBlocState currentState,
        ) {
          print('currentState: $currentState');
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
            child: GestureDetector(
              onTap: () => {
                _bigBlocBloc.incrementCounter.add(null)
              },
              key: Key('content_id_${_bigBlocBloc.outCounter}'),
              child: new Center(
                ///注意这里，通过stream构建ui
                child: StreamBuilder<int>(
                  stream: _bigBlocBloc.outCounter,
                  initialData: 0,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                    return Text('You hit me: ${snapshot.data} times');
                  }
                ),
              ),
            ),
          );
        })
    );
    // return BlocBuilder<BigBlocEvent, BigBlocState>(
    //     bloc: widget._bigBlocBloc,
    //     builder: (
    //       BuildContext context,
    //       BigBlocState currentState,
    //     ) {
    //       print('currentState: $currentState');
    //       if (currentState is UnBigBlocState) {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //       if (currentState is ErrorBigBlocState) {
    //         return new Container(
    //           child: new Center(
    //           child: new Text(currentState.errorMessage ?? 'Error' ),
    //         ));
    //       }
    //       return new Container(
    //         child: GestureDetector(
    //           onTap: () => {
    //             _bigBlocBloc.incrementCounter.add(null)
    //           },
    //           key: Key('content_id_${_bigBlocBloc.outCounter}'),
    //           child: new Center(
    //             ///注意这里，通过stream构建ui
    //             child: StreamBuilder<int>(
    //               stream: _bigBlocBloc.outCounter,
    //               initialData: 0,
    //               builder: (BuildContext context, AsyncSnapshot<int> snapshot){
    //                 return Text('You hit me: ${snapshot.data} times');
    //               }
    //             ),
    //           ),
    //         ),
    //       );
    //     });
  }

}
