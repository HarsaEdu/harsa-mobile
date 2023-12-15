import 'package:dio/dio.dart';
import 'package:harsa_mobile/models/auth_models/auth_model.dart';
import 'package:harsa_mobile/utils/constants/urls.dart';

class AuthService {
  static final Dio dio = Dio();

  static Future<AuthModel> register({
    required String username,
    required String email,
    required String password,
  }) async {
    AuthModel? authModel;

    try {
      const String url = "${Urls.baseUrl}${Urls.platformUrl}/auth/register";
      final Map data = {
        "username": username,
        "email": email,
        "password": password,
      };

      final Response response = await dio.post(url, data: data);

      authModel = AuthModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }

    return authModel;
  }

  static Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    AuthModel? authModel;

    try {
      const String url = "${Urls.baseUrl}${Urls.platformUrl}/auth/login";
      final Map data = {
        "email": email,
        "password": password,
      };
      final Response response = await dio.post(url, data: data);

      authModel = AuthModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }

    return authModel;
  }

  static Future<AuthModel> refreshToken({
    required String refreshToken,
  }) async {
    AuthModel? authModel;

    try {
      const String url = "${Urls.baseUrl}${Urls.platformUrl}/auth/access-token";
      final Map data = {"refresh_token": refreshToken};
      final Response response = await dio.post(url, data: data);

      authModel = AuthModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }

    return authModel;
  }
}
