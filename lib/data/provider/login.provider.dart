import 'package:novi_test/data/model/login_model.dart';
import 'package:novi_test/data/service/Login/login_service.dart';
import 'package:novi_test/utils/config/logger_extension';

class LoginProvider {
  final LoginService loginService = LoginService();
  Future<LoginModel> login(
      {required String username, required String password}) async {
    try {
      final response = await loginService.login(
        username: username,
        password: password,
      );
      final LoginModel loginModel =
          LoginModel.fromJson(response?.data as Map<String, dynamic>);
      return loginModel;
    } on Exception catch (e) {
      e.logWarn();
      rethrow;
    }
  }
}
