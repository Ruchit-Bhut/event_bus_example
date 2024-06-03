import 'package:event_bus_example/without_provider/app_state.dart';
import 'package:event_bus_example/event_example/event_bus.dart';
import 'package:event_bus_example/event_example/events.dart' as events;
import 'package:flutter/material.dart';

class WithoutProviderHomeScreen extends StatelessWidget {
  const WithoutProviderHomeScreen({super.key});

  void _sendEvents(BuildContext context) {
    eventBus.fire(events.StringEvent('Welcome To Jurassic Park'));
    eventBus.fire(events.IntEvent(23));
    eventBus.fire(events.DoubleEvent(3.14159265));
    eventBus.fire(events.ListEvent(['Disha', 'Ruchit', 'Nandni']));
    eventBus.fire(events.MapEvent({'One': 1, 'Two': 2}));
    eventBus.fire(events.ObjectEvent(events.MyObject('Captain Jack Sparrow', 40)));

    AppState.message = 'Welcome To Jurassic Park';
    AppState.number = 23;
    AppState.value = 3.14159265;
    AppState.items = ['Disha', 'Ruchit', 'Nandni'];
    AppState.mapItems = {'One': 1, 'Two': 2};
    AppState.myObject = events.MyObject('Captain Jack Sparrow', 40);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff362842),
      appBar: AppBar(
        backgroundColor: const Color(0xff362842),
        title: const Text('Home Screen', style: TextStyle(color: Color(0xffc5b6d2), fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => _sendEvents(context),
              child: Container(
                height: MediaQuery.of(context).size.height / 30,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: const Color(0xffc5b6d2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [BoxShadow(color: Color(0xfff2ceae), blurRadius: 8)],
                ),
                child: const Center(child: Text('Send Events', style: TextStyle(color: Color(0xff111135), fontSize: 20, fontWeight: FontWeight.w600))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavigationButton(context, 'Screen One', '/screenOne'),
                _buildNavigationButton(context, 'Screen Two', '/screenTwo'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton(BuildContext context, String label, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        height: MediaQuery.of(context).size.height / 30,
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
          color: const Color(0xffc5b6d2),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Color(0xfff2ceae), blurRadius: 8)],
        ),
        child: Center(child: Text(label, style: const TextStyle(color: Color(0xff111135), fontSize: 20, fontWeight: FontWeight.w600))),
      ),
    );
  }
}