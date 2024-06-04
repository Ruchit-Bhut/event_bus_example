import 'package:event_bus_example/chnageColor_afterEveryClick_manualyScreenChange/manualy_screens/color_home_screen.dart';
import 'package:event_bus_example/chnageColor_afterEveryClick_manualyScreenChange/manualy_screens/screen_one_color.dart';
import 'package:event_bus_example/chnageColor_afterEveryClick_manualyScreenChange/manualy_screens/screen_two_color.dart';
import 'package:flutter/material.dart';

class NavigationExampleColor extends StatefulWidget {
  const NavigationExampleColor({super.key});

  @override
  State<NavigationExampleColor> createState() => NavigationExampleColorState();
}

class NavigationExampleColorState extends State<NavigationExampleColor> {
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
            selectedIcon: Icon(Icons.home, color: Colors.white),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.looks_one, color: Colors.white),
            icon: Icon(Icons.looks_one),
            label: 'Screen One',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.looks_two, color: Colors.white),
            icon: Icon(Icons.looks_two),
            label: 'Screen Two',
          ),
        ],
      ),
      body: Stack(
        children: [
          Offstage(offstage: currentPageIndex != 0, child: const HomeScreenColor()),
          Offstage(offstage: currentPageIndex != 1, child: const ScreenOneColor()),
          Offstage(offstage: currentPageIndex != 2, child: const ScreenTwoColor()),
        ],
      ),
    );
  }
}