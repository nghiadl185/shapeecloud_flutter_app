// ignore_for_file: prefer_final_fields, deprecated_member_use, unused_field

import 'package:flutter/material.dart';
import 'package:shapeecloud_flutter_app/app/utils/app_color.dart';

class BoxbuttonProvider extends ChangeNotifier {

  List<Color> _colorsBackground = [];
  Color _colorsBorder = AppColor.BorderRadius;
  Color get colorsBorder => _colorsBorder;

  List<Color> setStatus(String status, String item, bool isClick) {
    switch (status) {
      case 'mood':
        _colorsBorder = AppColor.BorderRadius;

        if (item == 'Very Sad') {
          _colorsBackground = !isClick ? 
            [AppColor.background_menu, AppColor.background_menu] : 
            [ Color.fromARGB(0, 255, 38, 0).withOpacity(1), Color.fromARGB(0, 255, 138, 43).withOpacity(1)];
        }
        if (item == 'Sad') {
          _colorsBackground = !isClick ? 
            [AppColor.background_menu, AppColor.background_menu] : 
            [ Color.fromARGB(0, 247, 137, 48).withOpacity(1), Color.fromARGB(0, 138, 165, 18).withOpacity(1)];
        }
        if (item == 'Neutral') {
          _colorsBackground = !isClick ? 
            [AppColor.background_menu, AppColor.background_menu] : 
            [ Color(0x006a7282).withOpacity(1), Color(0x002b7fff).withOpacity(1)];
        }
        if (item == 'Happy') {
          _colorsBackground = !isClick ? 
            [AppColor.background_menu, AppColor.background_menu] : 
            [ Color.fromARGB(0, 166, 243, 130).withOpacity(1), Color.fromARGB(0, 104, 173, 72).withOpacity(1)];
        }
        if (item == 'Very Happy') {
          _colorsBackground = !isClick ? 
            [AppColor.background_menu, AppColor.background_menu] : 
            [ Color.fromARGB(0, 0, 255, 13).withOpacity(1), Color.fromARGB(0, 25, 133, 48).withOpacity(1)];
        }
        break;

      case 'Energy':
        _colorsBackground = !isClick ? 
          [AppColor.background_menu, AppColor.background_menu] : 
          [ AppColor.button_menu.withOpacity(0.2), AppColor.button_menu.withOpacity(0.2)];
        _colorsBorder = !isClick ? AppColor.BorderRadius : AppColor.button_menu;
        break;

      case 'Stress': 
        _colorsBackground = !isClick ?
          [AppColor.background_menu, AppColor.background_menu] : 
          [ AppColor.red2.withOpacity(0.2), AppColor.red3.withOpacity(0.2)];
        _colorsBorder = !isClick ? AppColor.BorderRadius : AppColor.red1;
        break;

      default:
         _colorsBackground = [AppColor.background_menu, AppColor.background_menu];
         _colorsBorder = AppColor.BorderRadius;
    }
    return _colorsBackground;
  }
}