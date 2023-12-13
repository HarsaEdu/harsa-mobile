import 'package:dio/dio.dart';
import 'package:harsa_mobile/models/classes_models.dart/get_user_courses_model.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:harsa_mobile/utils/constants/urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoursesService {
  static final Dio dio = Dio();

  static Future<UserCoursesModel?> getUserCourses({
    required String filter,
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(SPKey.accessToken);

    if (token == null) return null;
    dio.options.headers["Authorization"] = "Bearer $token";

    final String url =
        "${Urls.baseUrl}${Urls.platformUrl}/users/course/trackings?offset=0&limit=10&status=$filter";

    try {
      final Response response = await dio.get(url);

      return UserCoursesModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
