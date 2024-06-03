import 'package:flutter/material.dart';
import 'event_mixin.dart';
import 'events.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> with EventMixin<ScreenTwo> {
  List<String> _messages = ['Waiting for events...'];

  void _addMessage(String message) {
    setState(() {
      if (_messages.length == 1 && _messages[0] == 'Waiting for events...') {
        _messages = [message];
      } else {
        _messages.add(message);
      }
    });
  }

  @override
  void handleStringEvent(StringEvent event) {
    _addMessage('Received StringEvent: ${event.message}');
    print('Received StringEvent: ${event.message}');
  }

  @override
  void handleIntEvent(IntEvent event) {
    _addMessage('Received IntEvent: ${event.number}');
    print('Received IntEvent: ${event.number}');
  }

  @override
  void handleDoubleEvent(DoubleEvent event) {
    _addMessage('Received DoubleEvent: ${event.value}');
    print('Received DoubleEvent: ${event.value}');
  }

  @override
  void handleListEvent(ListEvent event) {
    _addMessage('Received ListEvent: ${event.items.join(', ')}');
    print('Received ListEvent: ${event.items.join(', ')}');
  }

  @override
  void handleMapEvent(MapEvent event) {
    _addMessage('Received MapEvent: ${event.items.toString()}');
    print('Received MapEvent: ${event.items.toString()}');
  }

  @override
  void handleObjectEvent(ObjectEvent event) {
    _addMessage('Received ObjectEvent: ${event.myObject.name}, ${event.myObject.age}');
    print('Received ObjectEvent: ${event.myObject.name}, ${event.myObject.age}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Two'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _messages[index],
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/screenThree', arguments: _messages);
              },
              child: const Text('Go to Screen Three'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}