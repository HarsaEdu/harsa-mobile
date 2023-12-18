import 'package:dio/dio.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_model.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_no_login_model.dart';
import 'package:harsa_mobile/models/classes_models.dart/user_courses_model.dart';
import 'package:harsa_mobile/models/post_model.dart';
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

  static Future<CourseDetailsModel?> getCourseDetails({
    required int courseId,
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(SPKey.accessToken);

    if (token == null) return null;
    dio.options.headers["Authorization"] = "Bearer $token";

    final String url =
        "${Urls.baseUrl}${Urls.platformUrl}/users/course/$courseId";

    try {
      final Response response = await dio.get(url);

      return CourseDetailsModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }

  static Future<CourseDetailsNoLoginModel?> getCourseDetailsNoLogin({
    required int courseId,
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(SPKey.accessToken);

    if (token == null) return null;
    dio.options.headers["Authorization"] = "Bearer $token";

    final String url = "${Urls.baseUrl}${Urls.platformUrl}/courses/$courseId";

    try {
      final Response response = await dio.get(url);

      return CourseDetailsNoLoginModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }

  static Future<PostModel?> enrollCourse({
    required int courseId,
  }) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(SPKey.accessToken);

    if (token == null) return null;
    dio.options.headers["Authorization"] = "Bearer $token";

    final String url =
        "${Urls.baseUrl}${Urls.platformUrl}/users/course/$courseId/enrolled";

    try {
      final Response response = await dio.post(url);

      return PostModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
