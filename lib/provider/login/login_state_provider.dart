import 'package:flutter/material.dart';
import 'package:novi_test/data/model/login_model.dart';
import 'package:novi_test/data/repository/login_repo.dart';

class LoginState with ChangeNotifier {
  LoginRepo loginRepo = LoginRepo();

  bool _isLoading = false;
  LoginModel? _loginModel;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  LoginModel? get loginModel => _loginModel;
  String? get errorMessage => _errorMessage;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    // await loginRepo.login(username: username, password: password);

    try {
      _loginModel =
          await loginRepo.login(username: username, password: password);
    } catch (e) {
      _errorMessage = 'Failed to login. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
