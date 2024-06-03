import 'dart:async';
import 'package:flutter/material.dart';
import 'event_bus.dart';
import 'events.dart';

mixin EventMixin<T extends StatefulWidget> on State<T> {
  final List<StreamSubscription> _subscriptions = [];

  @override
  void initState() {
    super.initState();

    _subscriptions.add(eventBus.on<StringEvent>().listen((event) {
      if (mounted) handleStringEvent(event);
    }));

    _subscriptions.add(eventBus.on<IntEvent>().listen((event) {
      if (mounted) handleIntEvent(event);
    }));

    _subscriptions.add(eventBus.on<DoubleEvent>().listen((event) {
      if (mounted) handleDoubleEvent(event);
    }));

    _subscriptions.add(eventBus.on<ListEvent>().listen((event) {
      if (mounted) handleListEvent(event);
    }));

    _subscriptions.add(eventBus.on<MapEvent>().listen((event) {
      if (mounted) handleMapEvent(event);
    }));

    _subscriptions.add(eventBus.on<ObjectEvent>().listen((event) {
      if (mounted) handleObjectEvent(event);
    }));
  }

  @override
  void dispose() {
    for (var subscription in _subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }

  void handleStringEvent(StringEvent event) {}
  void handleIntEvent(IntEvent event) {}
  void handleDoubleEvent(DoubleEvent event) {}
  void handleListEvent(ListEvent event) {}
  void handleMapEvent(MapEvent event) {}
  void handleObjectEvent(ObjectEvent event) {}
}
