import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:startup_namer/screens/big_bloc/index.dart';

class BigBlocBloc extends Bloc<BigBlocEvent, BigBlocState> {
  static final BigBlocBloc _bigBlocBlocSingleton = new BigBlocBloc._internal();
  factory BigBlocBloc() {
    return _bigBlocBlocSingleton;
  }
  BigBlocBloc._internal() {
    _counter = 0;
    _actionController.stream.listen(_handleLogic);
  }
  
  BigBlocState get initialState => new UnBigBlocState();
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
  Stream<BigBlocState> mapEventToState(
    BigBlocEvent event,
  ) async* {
    try {
      yield await event.applyAsync(currentState: currentState, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield currentState;
    }
  }
}
