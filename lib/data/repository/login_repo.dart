import 'package:novi_test/data/model/login_model.dart';
import 'package:novi_test/data/provider/login.provider.dart';
import 'package:novi_test/utils/config/logger_extension';

class LoginRepo {
  final LoginProvider loginProvider = LoginProvider();
  Future<LoginModel> login({
    required String username,
    required String password,
  }) async {
    try {
      final LoginModel response = await loginProvider.login(
        username: username,
        password: password,
      );
      return response;
    } on Exception catch (e) {
      e.logWarn();
      rethrow;
    }
  }
}
