import 'package:event_bus/event_bus.dart';
import 'package:rxdart/rxdart.dart';

/// The global [EventBus] object.
EventBus behaviorBus = EventBus.customController(BehaviorSubject());

class UserLoggedInEvent {
  var user;

  UserLoggedInEvent(this.user);
}

class NewOrderEvent {
  var order;

  NewOrderEvent(this.order);
}