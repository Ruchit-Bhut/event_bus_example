import 'package:flutter/foundation.dart';

class DataProvider extends ChangeNotifier {
  String _message = "Initial Message";
  int _number = 0;
  double _value = 0.0;
  List<String> _items = [];
  Map<String, int> _mapItems = {};
  DataProviderMyObject _myObject = DataProviderMyObject("Initial Name", 0);

  String get message => _message;
  int get number => _number;
  double get value => _value;
  List<String> get items => _items;
  Map<String, int> get mapItems => _mapItems;
  DataProviderMyObject get myObject => _myObject;

  void updateMessage(String newMessage) {
    _message = newMessage;
    notifyListeners();
  }

  void updateNumber(int newNumber) {
    _number = newNumber;
    notifyListeners();
  }

  void updateValue(double newValue) {
    _value = newValue;
    notifyListeners();
  }

  void updateItems(List<String> newItems) {
    _items = newItems;
    notifyListeners();
  }

  void updateMapItems(Map<String, int> newMapItems) {
    _mapItems = newMapItems;
    notifyListeners();
  }

  void updateMyObject(DataProviderMyObject newObject) {
    _myObject = newObject;
    notifyListeners();
  }
}

class DataProviderMyObject {
  final String name;
  final int age;

  DataProviderMyObject(this.name, this.age);
}
