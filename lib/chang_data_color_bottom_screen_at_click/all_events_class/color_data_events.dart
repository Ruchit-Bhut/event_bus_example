class StringsEvent {
  final String message;

  StringsEvent(this.message);
}

class IntegerEvent {
  final int number;

  IntegerEvent(this.number);
}

class DoublesEvent {
  final double value;

  DoublesEvent(this.value);
}

class ListsEvent {
  final List<String> items;

  ListsEvent(this.items);
}

class MapsEvent {
  final Map<String, int> items;

  MapsEvent(this.items);
}

class ObjectsEvent {
  final MyObjects myObject;

  ObjectsEvent(this.myObject);
}

class MyObjects {
  final String name;
  final int age;

  MyObjects(this.name, this.age);
}

class ActiveScreenEvent {
  final String screenName;

  ActiveScreenEvent(this.screenName);
}

class ActiveTextEvent {
  final String screenName;

  ActiveTextEvent(this.screenName);
}
