import 'package:dio/dio.dart';
import 'package:harsa_mobile/models/post_model.dart';
import 'package:harsa_mobile/models/profile_models/create_profile_model.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:harsa_mobile/utils/constants/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  static final Dio dio = Dio();

  static Future<CreateProfileModel?> createProfile({
    required String firstName,
    required String lastName,
    required String phone,
    required String gender,
    required String dob,
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(SPKey.accessToken);

    if (token == null) return null;

    CreateProfileModel? createProfileModel;

    const String url =
        "${Urls.baseUrl}${Urls.platformUrl}/users/profile/myprofile";
    final Map data = {
      "first_name": firstName,
      "last_name": lastName,
      "phone_number": phone,
      "gender": gender,
      "date_birth": dob
    };

    dio.options.headers["Authorization"] = "Bearer $token";

    try {
      final Response response = await dio.post(url, data: data);

      createProfileModel = CreateProfileModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }

    return createProfileModel;
  }

  static Future<PostModel?> updateEmail({
    required String email,
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(SPKey.accessToken);

    if (token == null) return null;

    const String url = "${Urls.baseUrl}${Urls.platformUrl}/users/my-account";
    final Map data = {
      "email": email,
      "username": "",
    };

    dio.options.headers["Authorization"] = "Bearer $token";

    try {
      final Response response = await dio.put(url, data: data);

      if (response.statusCode == 200) return PostModel.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
    return null;
  }

  static Future<PostModel?> updateSandi({
    required String oldPass,
    required String newPass,
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(SPKey.accessToken);

    if (token == null) return null;

    const String url =
        "${Urls.baseUrl}${Urls.platformUrl}/users/my-account/password";
    final Map data = {
      "old_password": oldPass,
      "new_password": newPass,
    };

    dio.options.headers["Authorization"] = "Bearer $token";

    try {
      final Response response = await dio.put(url, data: data);

      if (response.statusCode == 200) return PostModel.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
    return null;
  }
}
