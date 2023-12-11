import 'package:dio/dio.dart';
import 'package:harsa_mobile/models/profile_models/create_profile_model.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:harsa_mobile/utils/constants/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  static final Dio dio = Dio();

  static Future<CreateProfileModel> createProfile({
    required String firstName,
    required String lastName,
    required String phone,
    required String gender,
    required String dob,
  }) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? accessToken = preferences.getString(SPKey.accessToken);

    CreateProfileModel? createProfileModel;

    try {
      const String url =
          "${Urls.baseUrl}${Urls.platformUrl}/users/profile/myprofile";
      final Map data = {
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phone,
        "gender": gender,
        "date_birth": dob
      };

      dio.options.headers["Authorization"] = "Bearer $accessToken";

      final Response response = await dio.post(url, data: data);

      createProfileModel = CreateProfileModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }

    return createProfileModel;
  }
}
