import 'dart:async';
import 'package:startup_namer/screens/big_bloc/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BigBlocEvent {
  Future<BigBlocState> applyAsync(
      {BigBlocState currentState, BigBlocBloc bloc});
  final BigBlocProvider _bigBlocProvider = new BigBlocProvider();
}

class LoadBigBlocEvent extends BigBlocEvent {
  @override
  String toString() => 'LoadBigBlocEvent';

  @override
  Future<BigBlocState> applyAsync(
      {BigBlocState currentState, BigBlocBloc bloc}) async {
    try {
      await Future.delayed(new Duration(seconds: 2));
      this._bigBlocProvider.test();
      return new InBigBlocState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return new ErrorBigBlocState(_?.toString());
    }
  }
}
