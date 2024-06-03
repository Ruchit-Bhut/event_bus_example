import 'package:event_bus_example/event_example/events.dart' as events;

class AppState {
  static String _message = "Initial Message";
  static int _number = 0;
  static double _value = 0.0;
  static List<String> _items = [];
  static Map<String, int> _mapItems = {};
  static events.MyObject _myObject = events.MyObject("Initial Name", 0);

  static String get message => _message;
  static int get number => _number;
  static double get value => _value;
  static List<String> get items => _items;
  static Map<String, int> get mapItems => _mapItems;
  static events.MyObject get myObject => _myObject;

  static set message(String newMessage) => _message = newMessage;
  static set number(int newNumber) => _number = newNumber;
  static set value(double newValue) => _value = newValue;
  static set items(List<String> newItems) => _items = newItems;
  static set mapItems(Map<String, int> newMapItems) => _mapItems = newMapItems;
  static set myObject(events.MyObject newObject) => _myObject = newObject;
}