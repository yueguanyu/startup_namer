import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class OtherState extends Equatable {
  OtherState([Iterable props]) : super(props);

  /// Copy object for use in action
  OtherState getStateCopy();
}

/// UnInitialized
class UnOtherState extends OtherState {
  @override
  String toString() => 'UnOtherState';

  @override
  OtherState getStateCopy() {
    return UnOtherState();
  }
}

/// Initialized
class InOtherState extends OtherState {
  @override
  String toString() => 'InOtherState';

  @override
  OtherState getStateCopy() {
    return InOtherState();
  }
}

class ErrorOtherState extends OtherState {
  final String errorMessage;

  ErrorOtherState(this.errorMessage);
  
  @override
  String toString() => 'ErrorOtherState';

  @override
  OtherState getStateCopy() {
    return ErrorOtherState(this.errorMessage);
  }
}
