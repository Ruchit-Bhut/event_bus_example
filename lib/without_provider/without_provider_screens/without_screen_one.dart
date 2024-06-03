import 'package:event_bus_example/without_provider/app_state.dart';
import 'package:flutter/material.dart';

class WithoutProviderScreenOne extends StatefulWidget {
  const WithoutProviderScreenOne({super.key});

  @override
  _WithoutProviderScreenOneState createState() => _WithoutProviderScreenOneState();
}

class _WithoutProviderScreenOneState extends State<WithoutProviderScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff362842),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Screen One', style: TextStyle(color: Color(0xffc5b6d2), fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xff362842),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Message: ${AppState.message}', style: const TextStyle(color: Color(0xffc5b6d2), fontSize: 20, fontWeight: FontWeight.w600)),
            Text('Age: ${AppState.number}', style: const TextStyle(color: Color(0xffc5b6d2), fontSize: 20, fontWeight: FontWeight.w600)),
            Text('Pi Value: ${AppState.value}', style: const TextStyle(color: Color(0xffc5b6d2), fontSize: 20, fontWeight: FontWeight.w600)),
            Text('Items: ${AppState.items.join(', ')}', style: const TextStyle(color: Color(0xffc5b6d2), fontSize: 20, fontWeight: FontWeight.w600)),
            Text('Map Items: ${AppState.mapItems.toString()}', style: const TextStyle(color: Color(0xffc5b6d2), fontSize: 20, fontWeight: FontWeight.w600)),
            Text('Object: ${AppState.myObject.name}, ${AppState.myObject.age}', style: const TextStyle(color: Color(0xffc5b6d2), fontSize: 20, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}