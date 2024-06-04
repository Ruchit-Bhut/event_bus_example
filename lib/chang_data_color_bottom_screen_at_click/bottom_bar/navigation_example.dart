import 'package:event_bus_example/chang_data_color_bottom_screen_at_click/data_screen/home_screen.dart';
import 'package:event_bus_example/chang_data_color_bottom_screen_at_click/data_screen/screen_one.dart';
import 'package:event_bus_example/chang_data_color_bottom_screen_at_click/data_screen/screen_two.dart';
import 'package:flutter/material.dart';
class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => NavigationExampleState();
}

class NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  void navigateToScreen(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xffc5b6d2),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color(0xff362842),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.looks_one,
              color: Colors.white,
            ),
            icon: Icon(Icons.looks_one),
            label: 'Screen One',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.looks_two,
              color: Colors.white,
            ),
            icon: Icon(Icons.looks_two),
            label: 'Screen Two',
          ),
        ],
      ),
      body: Stack(
        children: [
          Offstage(
            offstage: currentPageIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: currentPageIndex != 1,
            child: const ScreenOne(),
          ),
          Offstage(
            offstage: currentPageIndex != 2,
            child: const ScreenTwo(),
          ),
        ],
      ),
    );
  }
}
