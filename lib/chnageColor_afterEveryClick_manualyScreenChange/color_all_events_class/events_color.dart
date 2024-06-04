// events_color.dart
import 'package:flutter/material.dart';

class StringEventColor {
  final String message;
  StringEventColor(this.message);
}

class IntEventColor {
  final int number;
  IntEventColor(this.number);
}

class DoubleEventColor {
  final double value;
  DoubleEventColor(this.value);
}

class ListEventColor {
  final List<String> items;
  ListEventColor(this.items);
}

class MapEventColor {
  final Map<String, int> items;
  MapEventColor(this.items);
}

class MyObjectColor {
  final String name;
  final int age;
  MyObjectColor(this.name, this.age);
}

class ObjectEventColor {
  final MyObjectColor myObject;
  ObjectEventColor(this.myObject);
}

class ActiveScreenEventColor {
  final String screenName;
  ActiveScreenEventColor(this.screenName);
}

class ColorsEvents {
  final Color color;
  final String screenName;
  ColorsEvents(this.color, this.screenName);
}