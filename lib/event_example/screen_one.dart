import 'package:flutter/material.dart';
import 'event_bus.dart';
import 'events.dart';

// In screen_one.dart
class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen One'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/screenTwo');
          },
          child: const Text('Go to Screen Two'),
        ),
      ),
    );
  }
}
