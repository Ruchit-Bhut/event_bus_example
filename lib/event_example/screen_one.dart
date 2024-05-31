import 'package:flutter/material.dart';
import 'event_bus.dart';
import 'events.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen One'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                eventBus.fire(StringEvent('Hello from Screen One'));
                Navigator.pushNamed(context, '/screenTwo');
              },
              child: const Text('Send String Event'),
            ),
            ElevatedButton(
              onPressed: () {
                eventBus.fire(IntEvent(42));
                Navigator.pushNamed(context, '/screenTwo');
              },
              child: const Text('Send Int Event'),
            ),
            ElevatedButton(
              onPressed: () {
                eventBus.fire(DoubleEvent(3.14));
                Navigator.pushNamed(context, '/screenTwo');
              },
              child: const Text('Send Double Event'),
            ),
            ElevatedButton(
              onPressed: () {
                eventBus.fire(ListEvent(['One', 'Two', 'Three']));
                Navigator.pushNamed(context, '/screenTwo');
              },
              child: const Text('Send List Event'),
            ),
            ElevatedButton(
              onPressed: () {
                eventBus.fire(MapEvent({'One': 1, 'Two': 2}));
                Navigator.pushNamed(context, '/screenTwo');
              },
              child: const Text('Send Map Event'),
            ),
            ElevatedButton(
              onPressed: () {
                eventBus.fire(ObjectEvent(MyObject('John Doe', 30)));
                Navigator.pushNamed(context, '/screenTwo');
              },
              child: const Text('Send Object Event'),
            ),
          ],
        ),
      ),
    );
  }
}
