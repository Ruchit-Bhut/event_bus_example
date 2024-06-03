
import 'package:event_bus_example/without_provider/without_provider_screens/without_home_screen.dart';
import 'package:event_bus_example/without_provider/without_provider_screens/without_screen_one.dart';
import 'package:event_bus_example/without_provider/without_provider_screens/without_screen_two.dart';
import 'package:flutter/material.dart';

class WithoutProviderBottomNavigation extends StatefulWidget {
  const WithoutProviderBottomNavigation({super.key});

  @override
  State<WithoutProviderBottomNavigation> createState() => _WithoutProviderBottomNavigationState();
}

class _WithoutProviderBottomNavigationState extends State<WithoutProviderBottomNavigation> {
  int currentPageIndex = 0;

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
              Icons.settings,
              color: Colors.white,
            ),
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
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
              Icons.person,
              color: Colors.white,
            ),
            icon: Icon(Icons.person),
            label: 'Person',
          ),
        ],
      ),
      body: [
        const WithoutProviderHomeScreen(),
        const WithoutProviderScreenOne(),
        const WithoutProviderScreenTwo(),
      ][currentPageIndex],
    );
  }
}
