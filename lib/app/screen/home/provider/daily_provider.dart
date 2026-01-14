// ignore_for_file: prefer_final_fields, use_build_context_synchronously

import 'package:flutter/material.dart';

class DailyProvider extends ChangeNotifier {
  double _progressEnergy = 0.1;
  double get progressEnergy => _progressEnergy;

  void updateProgressEnergy(double value) {
    _progressEnergy = value;
    notifyListeners();
  }

  double _progressStress = 0.1;
  double get progressStress => _progressStress;

  void updateProgressStress(double value) {
    _progressStress = value;
    notifyListeners();
  }
  
  String _status = '';
  String get status => _status;

  void setStatus(String value) {
    _status = value;
    notifyListeners();
  }

  String _moodStatus = '';
  String get moodStatus => _moodStatus;

  void setMoodStatus(String value) {
    _moodStatus = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setIsLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

}
