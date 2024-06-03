import 'package:event_bus_example/event_example/home_screen.dart';
import 'package:event_bus_example/event_example/screen_one.dart';
import 'package:event_bus_example/event_example/screen_three.dart';
import 'package:event_bus_example/event_example/screen_two.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        '/screenOne': (context) => const ScreenOne(),
        '/screenTwo': (context) => const ScreenTwo(),
        '/screenThree': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as List<String>;
          return ScreenThree(messages: args);
        },
      },
    );
  }
}