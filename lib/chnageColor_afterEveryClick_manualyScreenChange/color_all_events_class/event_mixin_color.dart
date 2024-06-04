// event_mixin_color.dart
import 'dart:async';
import 'package:event_bus_example/chnageColor_afterEveryClick_manualyScreenChange/color_all_events_class/events_color.dart';
import 'package:event_bus_example/event_example/event_bus.dart';
import 'package:flutter/material.dart';

mixin EventMixinColor<T extends StatefulWidget> on State<T> {
  String _message = "Empty Message";
  int _number = 0;
  double _value = 0.0;
  List<String> _items = [];
  Map<String, int> _mapItems = {};
  MyObjectColor _myObject = MyObjectColor("No Name", 0);
  final Color _defaultTextColor = const Color(0xffc5b6d2);
  final Color _activeTextColor = const Color(0xffd2c0b6);

  Color _backgroundColor = const Color(0xff362842);
  bool _isActiveScreen = false;

  final List<StreamSubscription> _subscriptions = [];

  @override
  void initState() {
    super.initState();

    _subscriptions.add(eventBus.on<ActiveScreenEventColor>().listen((event) {
      if (mounted && event.screenName == T.toString()) {
        setState(() {
          _isActiveScreen = true;
        });
      } else if (mounted) {
        setState(() {
          _isActiveScreen = false;
        });
      }
    }));

    _subscriptions.add(eventBus.on<StringEventColor>().listen((event) {
      if (mounted) setState(() => _message = event.message);
    }));

    _subscriptions.add(eventBus.on<IntEventColor>().listen((event) {
      if (mounted) setState(() => _number = event.number);
    }));

    _subscriptions.add(eventBus.on<DoubleEventColor>().listen((event) {
      if (mounted) setState(() => _value = event.value);
    }));

    _subscriptions.add(eventBus.on<ListEventColor>().listen((event) {
      if (mounted) setState(() => _items = event.items);
    }));

    _subscriptions.add(eventBus.on<MapEventColor>().listen((event) {
      if (mounted) setState(() => _mapItems = event.items);
    }));

    _subscriptions.add(eventBus.on<ObjectEventColor>().listen((event) {
      if (mounted) setState(() => _myObject = event.myObject);
    }));

    _subscriptions.add(eventBus.on<ColorsEvents>().listen((event) {
      if (mounted && event.screenName == T.toString()) {
        setState(() => _backgroundColor = event.color);
      }
    }));
  }

  @override
  void dispose() {
    for (var subscription in _subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }

  String get message => _message;
  int get number => _number;
  double get value => _value;
  List<String> get items => _items;
  Map<String, int> get mapItems => _mapItems;
  MyObjectColor get myObject => _myObject;

  Color get backgroundColor => _backgroundColor;
  Color get textColor => _isActiveScreen ? _activeTextColor : _defaultTextColor;
}