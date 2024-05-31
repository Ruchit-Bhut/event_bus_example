import 'package:flutter/material.dart';
import 'event_mixin.dart';
import 'events.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> with EventMixin<ScreenTwo> {
  String _message = 'Waiting for events...';

  @override
  void handleStringEvent(StringEvent event) {
    setState(() {
      _message = 'Received StringEvent: ${event.message}';
    });
  }

  @override
  void handleIntEvent(IntEvent event) {
    setState(() {
      _message = 'Received IntEvent: ${event.number}';
    });
  }

  @override
  void handleDoubleEvent(DoubleEvent event) {
    setState(() {
      _message = 'Received DoubleEvent: ${event.value}';
    });
  }

  @override
  void handleListEvent(ListEvent event) {
    setState(() {
      _message = 'Received ListEvent: ${event.items.join(', ')}';
    });
  }

  @override
  void handleMapEvent(MapEvent event) {
    setState(() {
      _message = 'Received MapEvent: ${event.items.toString()}';
    });
  }

  @override
  void handleObjectEvent(ObjectEvent event) {
    setState(() {
      _message = 'Received ObjectEvent: ${event.myObject.name}, ${event.myObject.age}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Two'),
      ),
      body: Center(
        child: Text(_message),
      ),
    );
  }
}
