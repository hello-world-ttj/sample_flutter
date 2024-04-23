import 'package:flutter/material.dart';
import 'package:my_first/screen/screen_home.dart';
import 'package:my_first/screen/screen_map.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

int _currentScreen = 0;
final _screens = [ScreenHome(), ScreenMap()];

class _NavigatorScreenState extends State<NavigatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentScreen],
      bottomNavigationBar: BottomNavigationBar(
          enableFeedback: true,
          currentIndex: _currentScreen,
          onTap: (value) => setState(() {
                _currentScreen = value;
              }),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          ]),
    );
  }
}
