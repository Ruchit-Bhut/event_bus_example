import 'dart:async';

class StringEvent {
  final String message;
  StringEvent(this.message);
}

class IntEvent {
  final int number;
  IntEvent(this.number);
}

class DoubleEvent {
  final double value;
  DoubleEvent(this.value);
}

class ListEvent {
  final List<String> items;
  ListEvent(this.items);
}

class MapEvent {
  final Map<String, int> items;
  MapEvent(this.items);
}

class ObjectEvent {
  final MyObject myObject;
  ObjectEvent(this.myObject);
}

class MyObject {
  final String name;
  final int age;
  MyObject(this.name, this.age);
}

class EventBus {
  static final EventBus _instance = EventBus._internal();

  factory EventBus() {
    return _instance;
  }

  EventBus._internal();

  final _eventControllers = <Type, StreamController>{};

  void fire<T extends Object>(T event) {
    final controller = _eventControllers.putIfAbsent(
      T,
          () => StreamController.broadcast(),
    );
    controller.sink.add(event);
  }

  Stream on<T extends Object>() {
    final controller = _eventControllers.putIfAbsent(
      T,
          () => StreamController.broadcast(),
    );
    return controller.stream;
  }

  void dispose() {
    _eventControllers.values.forEach((controller) => controller.close());
    _eventControllers.clear();
  }

  static EventBus get instance => _instance;
}