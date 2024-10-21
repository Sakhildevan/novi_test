import 'package:flutter/material.dart';

class PatientTreatCountProvider with ChangeNotifier {
  int _malePatients = 0;
  int _femalePatients = 0;

  String _selectedTreatment = 'Treatment 1';

  int get malePatients => _malePatients;
  int get femalePatients => _femalePatients;
  String get selectedTreatment => _selectedTreatment;

  void selectTreatment(String? treatment) {
    if (treatment != null) {
      _selectedTreatment = treatment;
      notifyListeners();
    }
  }

  void incrementMale() {
    _malePatients++;
    notifyListeners();
  }

  void decrementMale() {
    if (_malePatients > 0) _malePatients--;
    notifyListeners();
  }

  void incrementFemale() {
    _femalePatients++;
    notifyListeners();
  }

  void decrementFemale() {
    if (_femalePatients > 0) _femalePatients--;
    notifyListeners();
  }

  void resetCounts() {
    _malePatients = 0;
    _femalePatients = 0;
    notifyListeners();
  }
}
