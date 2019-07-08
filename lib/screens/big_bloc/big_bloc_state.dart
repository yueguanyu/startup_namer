import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BigBlocState extends Equatable {
  BigBlocState([Iterable props]) : super(props);

  /// Copy object for use in action
  BigBlocState getStateCopy();
}

/// UnInitialized
class UnBigBlocState extends BigBlocState {
  @override
  String toString() => 'UnBigBlocState';

  @override
  BigBlocState getStateCopy() {
    return UnBigBlocState();
  }
}

/// Initialized
class InBigBlocState extends BigBlocState {
  @override
  String toString() => 'InBigBlocState';

  @override
  BigBlocState getStateCopy() {
    return InBigBlocState();
  }
}

class ErrorBigBlocState extends BigBlocState {
  final String errorMessage;

  ErrorBigBlocState(this.errorMessage);
  
  @override
  String toString() => 'ErrorBigBlocState';

  @override
  BigBlocState getStateCopy() {
    return ErrorBigBlocState(this.errorMessage);
  }
}
