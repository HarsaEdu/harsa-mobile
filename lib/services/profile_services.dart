// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:harsa_mobile/models/profile_models/profile_models.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:harsa_mobile/utils/constants/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileServices {
  static final Dio _dio = Dio();

  static Map<String, String> head = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static String? token;

  static void setToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    token = sp.getString(SPKey.accessToken);
  }

  static Future<UserProfileData?> getUserProfile() async {
    setToken();
    if (token != null) {
      try {
        _dio.options.headers['Authorization'] = "Bearer $token";
        Response response = await _dio.get(
          '${Urls.baseUrl}${Urls.platformUrl}/users/profile/myprofile',
          options: Options(headers: head),
        );
        print(response.data);

        if (response.statusCode == 200) {
          return UserProfileData.fromJson(response.data['data']);
        } else {
          return null;
        }
      } on DioException catch (e) {
        print(e.message);
        rethrow;
      }
    }
    return null;
  }
}
