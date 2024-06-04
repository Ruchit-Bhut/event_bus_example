import 'package:event_bus_example/chang_data_color_bottom_screen_at_click/all_events_class/color_data_events.dart' as events;
import 'package:event_bus_example/chang_data_color_bottom_screen_at_click/all_events_class/color_data_events.dart';
import 'package:event_bus_example/chang_data_color_bottom_screen_at_click/bottom_bar/navigation_example.dart';
import 'package:event_bus_example/event_example/event_bus.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _sendEventsAndNavigate(BuildContext context, String screenName) {
    final navigationState = context.findAncestorStateOfType<NavigationExampleState>();
    if (navigationState != null) {
      navigationState.navigateToScreen(screenName == 'One' ? 1 : 2);

      Future.delayed(Duration.zero, () {
        String message = screenName == 'One' ? 'Welcome to Screen One!' : 'Welcome to Screen Two!';
        int number = screenName == 'One' ? 1 : 2;
        double value = screenName == 'One' ? 1.11111 : 2.22222;
        List<String> items = screenName == 'One' ? ['A', 'B', 'C'] : ['X', 'Y', 'Z'];
        Map<String, int> mapItems = screenName == 'One' ? {'A': 1, 'B': 2} : {'X': 10, 'Y': 20};
        String objectName = screenName == 'One' ? 'Alice' : 'Bob';

        eventBus.fire(ActiveScreenEvent('Screen$screenName'));
        eventBus.fire(events.StringsEvent(message));
        eventBus.fire(events.IntegerEvent(number));
        eventBus.fire(events.DoublesEvent(value));
        eventBus.fire(events.ListsEvent(items));
        eventBus.fire(events.MapsEvent(mapItems));
        eventBus.fire(events.ObjectsEvent(events.MyObjects(objectName, number * 10)));
      });
    }
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
      onTap: () => _sendEventsAndNavigate(context, label.split(' ').last),
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