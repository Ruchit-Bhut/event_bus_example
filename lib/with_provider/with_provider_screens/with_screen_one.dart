import 'package:event_bus_example/with_provider/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WithProviderScreenOne extends StatelessWidget {
  const WithProviderScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff362842),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Screen One',
          style: TextStyle(
            color: Color(0xffc5b6d2),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff362842),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Message: ${dataProvider.message}',
              style: const TextStyle(
                color: Color(0xffc5b6d2),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Age: ${dataProvider.number}',
              style: const TextStyle(
                color: Color(0xffc5b6d2),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Pi Value: ${dataProvider.value}',
              style: const TextStyle(
                color: Color(0xffc5b6d2),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Items: ${dataProvider.items.join(', ')}',
              style: const TextStyle(
                color: Color(0xffc5b6d2),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Map Items: ${dataProvider.mapItems.toString()}',
              style: const TextStyle(
                color: Color(0xffc5b6d2),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Object: ${dataProvider.myObject.name}, ${dataProvider.myObject.age}',
              style: const TextStyle(
                color: Color(0xffc5b6d2),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

