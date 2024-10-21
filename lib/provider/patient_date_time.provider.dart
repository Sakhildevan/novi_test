import 'package:flutter/material.dart';

class TreatmentDateTimeProvider with ChangeNotifier {
  DateTime? _selectedDate;
  int? _selectedHour;
  int? _selectedMinute;

  DateTime? get selectedDate => _selectedDate;
  int? get selectedHour => _selectedHour;
  int? get selectedMinute => _selectedMinute;

  void selectDate(DateTime? date) {
    _selectedDate = date;
    notifyListeners();
  }

  void selectHour(int? hour) {
    _selectedHour = hour;
    notifyListeners();
  }

  void selectMinute(int? minute) {
    _selectedMinute = minute;
    notifyListeners();
  }
}
