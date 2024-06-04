// color_home_screen.dart
import 'package:event_bus_example/chnageColor_afterEveryClick_manualyScreenChange/color_all_events_class/events_color.dart' as events;
import 'package:event_bus_example/event_example/event_bus.dart';
import 'package:flutter/material.dart';

class HomeScreenColor extends StatefulWidget {
  const HomeScreenColor({super.key});

  @override
  _HomeScreenColorState createState() => _HomeScreenColorState();
}

class _HomeScreenColorState extends State<HomeScreenColor> {
  int _colorIndex = 0;

  Color _getNextColor() {
    _colorIndex = (_colorIndex + 1) % 0xFFFFFF;
    return Color(0xFF000000 | _colorIndex);
  }

  void _sendEvents(String screenName) {
    String message = screenName == 'One' ? 'Welcome to Screen One!' : 'Welcome to Screen Two!';
    int number = screenName == 'One' ? 1 : 2;
    double value = screenName == 'One' ? 1.11111 : 2.22222;
    List<String> items = screenName == 'One' ? ['A', 'B', 'C'] : ['X', 'Y', 'Z'];
    Map<String, int> mapItems = screenName == 'One' ? {'A': 1, 'B': 2} : {'X': 10, 'Y': 20};
    String objectName = screenName == 'One' ? 'Alice' : 'Bob';

    eventBus.fire(events.ActiveScreenEventColor('Screen$screenName'));
    eventBus.fire(events.StringEventColor(message));
    eventBus.fire(events.IntEventColor(number));
    eventBus.fire(events.DoubleEventColor(value));
    eventBus.fire(events.ListEventColor(items));
    eventBus.fire(events.MapEventColor(mapItems));
    eventBus.fire(events.ObjectEventColor(events.MyObjectColor(objectName, number * 10)));
    eventBus.fire(events.ColorsEvents(_getNextColor(), 'Screen$screenName'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff362842),
      appBar: AppBar(
        backgroundColor: const Color(0xff362842),
        title: const Text(
          'Home Screen',
          style: TextStyle(
            color: Color(0xffc5b6d2),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavigationButton(context, 'Screen One'),
            _buildNavigationButton(context, 'Screen Two'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton(BuildContext context, String label) {
    return GestureDetector(
      onTap: () => _sendEvents(label.split(' ').last),
      child: Container(
        height: MediaQuery.of(context).size.height / 30,
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
          color: const Color(0xffc5b6d2),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0xfff2ceae),
              blurRadius: 8,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xff111135),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}