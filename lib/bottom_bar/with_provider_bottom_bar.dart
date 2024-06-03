import 'package:event_bus_example/with_provider/with_provider_screens/with_home_screen.dart';
import 'package:event_bus_example/with_provider/with_provider_screens/with_screen_one.dart';
import 'package:event_bus_example/with_provider/with_provider_screens/with_screen_two.dart';
import 'package:flutter/material.dart';

class WithProviderBottomNavigation extends StatefulWidget {
  const WithProviderBottomNavigation({super.key});

  @override
  State<WithProviderBottomNavigation> createState() => _WithProviderBottomNavigationState();
}

class _WithProviderBottomNavigationState extends State<WithProviderBottomNavigation> {
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
        const WithProviderHomeScreen(),
        const WithProviderScreenOne(),
        const WithProviderScreenTwo(),
      ][currentPageIndex],
    );
  }
}
