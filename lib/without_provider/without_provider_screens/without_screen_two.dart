import 'package:event_bus_example/without_provider/app_state.dart';
import 'package:event_bus_example/event_example/event_mixin.dart';
import 'package:event_bus_example/event_example/events.dart' as events;

import 'package:flutter/material.dart';

class WithoutProviderScreenTwo extends StatefulWidget {
  const WithoutProviderScreenTwo({super.key});

  @override
  _WithoutProviderScreenTwoState createState() => _WithoutProviderScreenTwoState();
}

class _WithoutProviderScreenTwoState extends State<WithoutProviderScreenTwo> with EventMixin<WithoutProviderScreenTwo> {
  @override
  void handleStringEvent(events.StringEvent event) {
    AppState.message = event.message;
    setState(() {});
  }

  @override
  void handleIntEvent(events.IntEvent event) {
    AppState.number = event.number;
    setState(() {});
  }

  @override
  void handleDoubleEvent(events.DoubleEvent event) {
    AppState.value = event.value;
    setState(() {});
  }

  @override
  void handleListEvent(events.ListEvent event) {
    AppState.items = event.items;
    setState(() {});
  }

  @override
  void handleMapEvent(events.MapEvent event) {
    AppState.mapItems = event.items;
    setState(() {});
  }

  @override
  void handleObjectEvent(events.ObjectEvent event) {
    AppState.myObject = event.myObject;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff362842),
      appBar: AppBar(
        backgroundColor: const Color(0xff362842),
        title: const Text('Screen Two', style: TextStyle(color: Color(0xffc5b6d2), fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Message: ${AppState.message}', style: const TextStyle(color: Color(0xffc5b6d2), fontSize: 20, fontWeight: FontWeight.w600)),
            Text('Number: ${AppState.number}', style: const TextStyle(color: Color(0xffc5b6d2), fontSize: 20, fontWeight: FontWeight.w600)),
            Text('Value: ${AppState.value}', style: const TextStyle(color: Color(0xffc5b6d2), fontSize: 20, fontWeight: FontWeight.w600)),
            Text('Items: ${AppState.items.join(', ')}', style: const TextStyle(color: Color(0xffc5b6d2), fontSize: 20, fontWeight: FontWeight.w600)),
            Text('Map Items: ${AppState.mapItems.toString()}', style: const TextStyle(color: Color(0xffc5b6d2), fontSize: 20, fontWeight: FontWeight.w600)),
            Text('Object: ${AppState.myObject.name}, ${AppState.myObject.age}', style: const TextStyle(color: Color(0xffc5b6d2), fontSize: 20, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}