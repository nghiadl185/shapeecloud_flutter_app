import 'package:flutter/material.dart';
import 'package:shapeecloud_flutter_app/app/screen/home/screen/homePage/daily_checkin.dart';
import 'package:shapeecloud_flutter_app/app/screen/home/screen/homePage/home_screen.dart'; 
import 'package:shapeecloud_flutter_app/app/screen/insightsPage/insights_screen.dart';
import 'package:shapeecloud_flutter_app/app/screen/kiaraPage/kiara_screen.dart';
import 'package:shapeecloud_flutter_app/app/screen/soundsPage/sounds_screen.dart';
import 'package:shapeecloud_flutter_app/app/utils/BottomNavigationBar.dart';

class Navigators {
  static void navigatePop(BuildContext context) {
    Navigator.pop(context);
  }
  static void navigateToBottomNavigation(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNavigation(menuIndex: index)),
    );
  }

  //HOME
  static void navigateToHomeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
  static void navigateToDailyCheckIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DailyCheckIn()),
    );
  }
  static void navigateToInsightsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InsightsScreen()),
    );
  }

  //KIARA  
  static void navigateToKiaraScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const KiaraScreen()),
    );
  }

  //SOUNDS  
  static void navigateToSoundsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SoundsScreen()),
    );
  }
}