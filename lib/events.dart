import 'package:event_bus/event_bus.dart';

/// The global [EventBus] object.
EventBus eventBus = EventBus();

class UserLoggedInEvent {
  var user;

  UserLoggedInEvent(this.user);
}

class NewOrderEvent {
  var order;

  NewOrderEvent(this.order);
}