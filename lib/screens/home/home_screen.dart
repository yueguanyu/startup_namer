import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startup_namer/screens/home/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
    @required HomeBloc homeBloc,
  })  : _homeBloc = homeBloc,
        super(key: key);

  final HomeBloc _homeBloc;

  @override
  HomeScreenState createState() {
    return new HomeScreenState(_homeBloc);
  }
}

class HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc;
  HomeScreenState(this._homeBloc);

  @override
  void initState() {
    super.initState();
    this._homeBloc.dispatch(LoadHomeEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeEvent, HomeState>(
        bloc: widget._homeBloc,
        builder: (
          BuildContext context,
          HomeState currentState,
        ) {
          if (currentState is UnHomeState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorHomeState) {
            return new Container(
              child: new Center(
                child: new Text(currentState.errorMessage ?? 'Error' ),
              )
            );
          }
          return new Container(
            child: GestureDetector(
              onTap: () => {
                _homeBloc.incrementCounter.add(null)
              },
              key: Key('content_id_${_homeBloc.outCounter}'),
              child: new Center(
                ///注意这里，通过stream构建ui
                child: StreamBuilder<int>(
                  stream: _homeBloc.outCounter,
                  initialData: 0,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                    return Text('You hit me: ${snapshot.data} times');
                  }
                ),
              ),
            ),
          );
        });
  }
}
