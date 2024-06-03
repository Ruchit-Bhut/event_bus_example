import 'package:event_bus_example/event_example/event_bus.dart';
import 'package:event_bus_example/event_example/events.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _sendEvents(BuildContext context) {
    Navigator.pushNamed(context, '/screenTwo').then((_) {
      // Fire events after ScreenTwo is fully loaded
      eventBus.fire(StringEvent('Welcome To Jurassic Park'));
      eventBus.fire(IntEvent(23));
      eventBus.fire(DoubleEvent(3.14159265));
      eventBus.fire(ListEvent(['Bhut', 'Ruchit', 'Nandni']));
      eventBus.fire(MapEvent({'One': 1, 'Two': 2}));
      eventBus.fire(ObjectEvent(MyObject('Captain Jack Sparrow', 40)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/screenOne');
              },
              child: const Text('Go to Screen One'),
            ),
            ElevatedButton(
              onPressed: () => _sendEvents(context),
              child: const Text('Go to Screen Two and Send Events'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/screenTwo').then((_) {
                  // Send additional events
                  eventBus.fire(StringEvent('More data incoming...'));
                  eventBus.fire(IntEvent(42));
                  eventBus.fire(ListEvent(['More', 'Data', 'Here']));
                });
              },
              child: const Text('Send More Events to Screen Two'),
            ),
          ],
        ),
      ),
    );
  }
}
