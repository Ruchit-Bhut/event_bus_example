import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              onPressed: () {
                Navigator.pushNamed(context, '/screenTwo');
              },
              child: const Text('Go to Screen Two'),
            ),
          ],
        ),
      ),
    );
  }
}
