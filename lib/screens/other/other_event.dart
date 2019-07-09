import 'dart:async';
import 'package:startup_namer/screens/other/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class OtherEvent {
  Future<OtherState> applyAsync(
      {OtherState currentState, OtherBloc bloc});
}

class LoadOtherEvent extends OtherEvent {
  @override
  String toString() => 'LoadOtherEvent';

  @override
  Future<OtherState> applyAsync(
      {OtherState currentState, OtherBloc bloc}) async {
    try {
      await Future.delayed(new Duration(seconds: 2));
      return new InOtherState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return new ErrorOtherState(_?.toString());
    }
  }
}
