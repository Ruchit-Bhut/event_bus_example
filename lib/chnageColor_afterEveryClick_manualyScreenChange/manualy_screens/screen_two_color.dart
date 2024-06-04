import 'package:event_bus_example/chnageColor_afterEveryClick_manualyScreenChange/color_all_events_class/event_mixin_color.dart';
import 'package:flutter/material.dart';

class ScreenTwoColor extends StatefulWidget {
  const ScreenTwoColor({super.key});

  @override
  _ScreenTwoColorState createState() => _ScreenTwoColorState();
}

class _ScreenTwoColorState extends State<ScreenTwoColor> with EventMixinColor<ScreenTwoColor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          'Screen Two',
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
            Text('Message: $message', style: textStyle),
            Text('Number: $number', style: textStyle),
            Text('Value: $value', style: textStyle),
            Text('Items: ${items.join(', ')}', style: textStyle),
            Text('Map Items: $mapItems', style: textStyle),
            Text('Object: ${myObject.name}, ${myObject.age}', style: textStyle),
          ],
        ),
      ),
    );
  }

  TextStyle get textStyle => TextStyle(
    color: textColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
}
