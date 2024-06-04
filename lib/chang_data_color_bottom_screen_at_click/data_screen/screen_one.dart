import 'package:event_bus_example/chang_data_color_bottom_screen_at_click/all_events_class/event_mixin.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> with EventMixin<ScreenOne> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title:  Text(
          'Screen One',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Message: $message',
              style:  TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Number: $number',
              style:  TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Value: $value',
              style:  TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Items: ${items.join(', ')}',
              style:  TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Map Items: $mapItems',
              style:  TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Object: ${myObject.name}, ${myObject.age}',
              style:  TextStyle(
                color: textColor,
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
