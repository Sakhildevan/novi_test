import 'package:flutter/material.dart';

class PatientProvider with ChangeNotifier {
  //variables
  bool isLoading = false;
  Future<void> onInit() async {
    isLoading = true;
    notifyListeners();
    //data Fetch(),
    await loadPatientData();
    isLoading = false;
    notifyListeners();
  }

  Future<void> loadPatientData() async {
//TODO: data load method
  }
}
