import 'package:event_bus_example/event_example/event_mixin.dart';
import 'package:event_bus_example/event_example/events.dart' as events;
import 'package:event_bus_example/with_provider/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WithProviderScreenTwo extends StatefulWidget {
  const WithProviderScreenTwo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WithProviderScreenTwoState createState() => _WithProviderScreenTwoState();
}

class _WithProviderScreenTwoState extends State<WithProviderScreenTwo> with EventMixin<WithProviderScreenTwo> {
  @override
  void handleStringEvent(events.StringEvent event) {
    Provider.of<DataProvider>(context, listen: false)
        .updateMessage(event.message);
  }

  @override
  void handleIntEvent(events.IntEvent event) {
    Provider.of<DataProvider>(context, listen: false)
        .updateNumber(event.number);
  }

  @override
  void handleDoubleEvent(events.DoubleEvent event) {
    Provider.of<DataProvider>(context, listen: false).updateValue(event.value);
  }

  @override
  void handleListEvent(events.ListEvent event) {
    Provider.of<DataProvider>(context, listen: false).updateItems(event.items);
  }

  @override
  void handleMapEvent(events.MapEvent event) {
    Provider.of<DataProvider>(context, listen: false)
        .updateMapItems(event.items);
  }

  @override
  void handleObjectEvent(events.ObjectEvent event) {
    Provider.of<DataProvider>(context, listen: false).updateMyObject(
        DataProviderMyObject(event.myObject.name, event.myObject.age));
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff362842),
      appBar: AppBar(
        backgroundColor: const Color(0xff362842),
        title: const Text(
          'Screen Two',
          style: TextStyle(
            color: Color(0xffc5b6d2),
            fontWeight: FontWeight.bold,
          ),
        ),
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
              'Number: ${dataProvider.number}',
              style: const TextStyle(
                color: Color(0xffc5b6d2),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Value: ${dataProvider.value}',
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

