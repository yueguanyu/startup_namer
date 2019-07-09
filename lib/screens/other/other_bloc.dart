import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:startup_namer/screens/other/index.dart';

class OtherBloc extends Bloc<OtherEvent, OtherState> {
  static final OtherBloc _otherBlocSingleton = new OtherBloc._internal();
  factory OtherBloc() {
    return _otherBlocSingleton;
  }
  OtherBloc._internal();
  
  OtherState get initialState => new UnOtherState();

  @override
  Stream<OtherState> mapEventToState(
    OtherEvent event,
  ) async* {
    try {
      yield await event.applyAsync(currentState: currentState, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield currentState;
    }
  }
}
