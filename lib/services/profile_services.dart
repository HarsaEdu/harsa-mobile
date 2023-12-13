import 'package:dio/dio.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
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

  
}
