import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:startup_namer/screens/big_bloc/index.dart';

class BigBlocBloc extends Bloc<BigBlocEvent, BigBlocState> {
  static final BigBlocBloc _bigBlocBlocSingleton = new BigBlocBloc._internal();
  factory BigBlocBloc() {
    return _bigBlocBlocSingleton;
  }
  BigBlocBloc._internal();
  
  BigBlocState get initialState => new UnBigBlocState();

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
