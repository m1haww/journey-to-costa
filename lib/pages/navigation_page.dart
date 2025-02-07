import 'package:flutter/material.dart';
import 'package:journey_to_costa/pages/aa_food_page.dart';
import 'package:journey_to_costa/pages/events_page.dart';
import 'package:journey_to_costa/pages/reservations_page.dart';
import 'package:journey_to_costa/pages/settings_page.dart';
import 'package:journey_to_costa/pages/sights_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const EventsPage(), // Events Page
    const ReservationsPage(), // Reservations Page
    AaFoodPage(), // Food Page
    const SightsPage(), // Sights Page
    SettingsPage(), // Settings Page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_currentIndex], // Show current page
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffF6F6F6),
        selectedItemColor: const Color(0xffDCA23D),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Change page
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Events"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book), label: "Reservations"),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: "Food"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_city), label: "Sights"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
