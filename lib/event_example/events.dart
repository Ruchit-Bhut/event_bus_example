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
