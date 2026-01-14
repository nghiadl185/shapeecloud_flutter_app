import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void updateIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
  
  List<NavigationDestination> destinations = const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),      
      selectedIcon: Icon(Icons.home),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.bar_chart_sharp),
      label: 'Insights',
    ),
    NavigationDestination(
      icon: Icon(Icons.chat_bubble_outline_outlined),
      label: 'Kiara',
    ),
    NavigationDestination(
      icon: Icon(Icons.music_note_outlined),
      label: 'Sounds',
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline_outlined),
      label: 'Profile',
    ),
  ];
  List<NavigationDestination> get destination => destinations;
}