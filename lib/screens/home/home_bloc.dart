import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:startup_namer/screens/home/index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static final HomeBloc _homeBlocSingleton = new HomeBloc._internal();
  factory HomeBloc() {
    return _homeBlocSingleton;
  }
  HomeBloc._internal() {
    _actionController.stream.listen(_handleLogic);
  }
  
  HomeState get initialState => new UnHomeState();

  int _counter = 0;
  //
  // Stream to handle the counter，第一组stream
  //
  StreamController<int> _counterController = StreamController<int>();
  StreamSink<int> get _inAdd => _counterController.sink;//这个sink用与给outCounter添加数据
  Stream<int> get outCounter => _counterController.stream;//这个就是ui需要使用的stream

  //
  // Stream to handle the action on the counter，第二组stream
  //
  StreamController _actionController = StreamController();
  StreamSink get incrementCounter => _actionController.sink;//这个暴露给外部，用户接受ui事件

  void _handleLogic(data){
    _counter = _counter + 1;
    _inAdd.add(_counter);
  }

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    try {
      yield await event.applyAsync(currentState: currentState, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield currentState;
    }
  }
}
