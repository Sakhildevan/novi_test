import 'dart:developer';

import 'package:dio/dio.dart';

import '../dio_base.service.dart';

class LoginService extends DioBaseService {
  final Dio _dio = DioBaseService.dio;
  Future<Response<dynamic>?> login(
      {required String username, required String password}) async {
    // final Object body = {"username": username, "password": password};
    FormData formData =
        FormData.fromMap({"username": username, "password": password});
    try {
      return await _dio.post(
        '/Login',
        data: formData,
      );
    } on DioException catch (e) {
      // Handle DioError
      log('Dio error: $e');
      if (e.response != null) {
        log('Dio error status: ${e.response!.statusCode}');
        log('Dio error message: ${e.response!.statusMessage}');
        log('Dio error data: ${e.response!.data}');
      } else {
        log('Dio request failed due to an exception: $e');
      }
      // Return null or rethrow the DioError to propagate it further
      rethrow;
    }
  }
}
