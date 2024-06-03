import 'package:event_bus_example/bottom_bar/with_provider_bottom_bar.dart';
import 'package:event_bus_example/without_provider/without_provider_bottom_bar.dart';
import 'package:event_bus_example/without_provider/without_provider_screens/without_screen_one.dart';
import 'package:event_bus_example/without_provider/without_provider_screens/without_screen_two.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*
/// With Provider Void Main
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const WithProviderBottomNavigation(),
        routes: {
          '/screenOne': (context) => const WithoutProviderScreenOne(),
          '/screenTwo': (context) => const WithoutProviderScreenTwo(),
        },
      ),
    );
  }
}*/




/// Without Provider Void Main
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WithoutProviderBottomNavigation(),
      routes: {
        '/screenOne': (context) => const WithoutProviderScreenOne(),
        '/screenTwo': (context) => const WithoutProviderScreenTwo(),
      },
    );
  }
}
