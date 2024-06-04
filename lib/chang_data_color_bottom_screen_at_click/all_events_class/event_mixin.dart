import 'dart:async';
import 'package:event_bus_example/chang_data_color_bottom_screen_at_click/all_events_class/color_data_events.dart';
import 'package:event_bus_example/event_example/event_bus.dart';
import 'package:flutter/material.dart';

mixin EventMixin<T extends StatefulWidget> on State<T> {
  String _message = "Empty Message";
  int _number = 0;
  double _value = 0.0;
  List<String> _items = [];
  Map<String, int> _mapItems = {};
  MyObjects _myObject = MyObjects("No Name", 0);
  final Color _defaultTextColor = const Color(0xffc5b6d2);
  final Color _activeTextColor = const Color(0xffd2c0b6);

  final Color _defaultBackgroundColor = const Color(0xff362842);
  final Color _activeBackgroundColor = const Color(0xff28423f);
  bool _isActiveScreen = false;

  final List<StreamSubscription> _subscriptions = [];

  @override
  void initState() {
    super.initState();

    _subscriptions.add(eventBus.on<ActiveScreenEvent>().listen((event) {
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


    _subscriptions.add(eventBus.on<ActiveTextEvent>().listen((event) {
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

    _subscriptions.add(eventBus.on<StringsEvent>().listen((event) {
      if (mounted) {
        setState(() {
          _message = event.message;
        });
      }
    }));

    _subscriptions.add(eventBus.on<IntegerEvent>().listen((event) {
      if (mounted) {
        setState(() {
          _number = event.number;
        });
      }
    }));

    _subscriptions.add(eventBus.on<DoublesEvent>().listen((event) {
      if (mounted) {
        setState(() {
          _value = event.value;
        });
      }
    }));

    _subscriptions.add(eventBus.on<ListsEvent>().listen((event) {
      if (mounted) {
        setState(() {
          _items = event.items;
        });
      }
    }));

    _subscriptions.add(eventBus.on<MapsEvent>().listen((event) {
      if (mounted) {
        setState(() {
          _mapItems = event.items;
        });
      }
    }));

    _subscriptions.add(eventBus.on<ObjectsEvent>().listen((event) {
      if (mounted) {
        setState(() {
          _myObject = event.myObject;
        });
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

  MyObjects get myObject => _myObject;


  Color get backgroundColor =>
      _isActiveScreen ? _activeBackgroundColor : _defaultBackgroundColor;

  Color get textColor => _isActiveScreen ? _activeTextColor : _defaultTextColor;
}
