import 'package:flutter/material.dart';

class PaymentState extends ChangeNotifier {
  // Default values for the radio buttons
  String _selectedPaymentOption = 'Cash';

  // Text field values
  String _totalAmount = '';
  String _discountAmount = '';
  String _advanceAmount = '';
  String _balanceAmount = '';

  // Getters for payment option and text fields
  String get selectedPaymentOption => _selectedPaymentOption;
  String get totalAmount => _totalAmount;
  String get discountAmount => _discountAmount;
  String get advanceAmount => _advanceAmount;
  String get balanceAmount => _balanceAmount;

  // Setters for payment option and text fields with notifyListeners()
  void selectPaymentOption(String value) {
    _selectedPaymentOption = value;
    notifyListeners();
  }

  void updateTotalAmount(String value) {
    _totalAmount = value;
    notifyListeners();
  }

  void updateDiscountAmount(String value) {
    _discountAmount = value;
    notifyListeners();
  }

  void updateAdvanceAmount(String value) {
    _advanceAmount = value;
    notifyListeners();
  }

  void updateBalanceAmount(String value) {
    _balanceAmount = value;
    notifyListeners();
  }
}
