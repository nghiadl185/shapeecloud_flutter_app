import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeProvider extends ChangeNotifier {

  DateTime lastLogged = DateTime.now(); // hoặc lấy từ server

  String formatLastLogged() {
    String dayString = DateFormat('EEEE').format(lastLogged); // Monday, Tuesday ...
    String timeString = DateFormat('h:mm a').format(lastLogged); // 9:30 AM
    String today = DateTime.now().day == lastLogged.day ? 'Today' : dayString;
    return 'Last logged: $today, $timeString';
  }  
}