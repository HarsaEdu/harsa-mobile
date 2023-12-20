import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_model.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_no_login_model.dart';
import 'package:harsa_mobile/models/course_recommendation/course_recommend.dart';
import 'package:harsa_mobile/services/course_recommendation_services.dart';
import 'package:harsa_mobile/services/courses_service.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecommendationScreenProvider extends ChangeNotifier {
  ScrollController scrollController = ScrollController();
  BuildContext? context;

  bool isLogin = false;
  List<Recommendation> courseRecomendationList = [];
  int crOffset = 0;
  int maxItem = 0;

  void onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMore();
    }
  }

  Future<void> checkPreference() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.getBool(SPKey.isLogged) != null ||
        sp.getBool(SPKey.isLogged) == true) {
      isLogin = true;
    } else {
      isLogin = false;
    }
  }

  void loadMore() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    CourseRecommendation? cr;
    if (sp.getBool(SPKey.isLogged) == null ||
        sp.getBool(SPKey.isLogged) == false) {
      crOffset = crOffset + 10;
      cr = await CourseRecommendationServices()
          .getAllCourse(offset: crOffset, limit: 10);
      if (cr != null) {
        courseRecomendationList.addAll(cr.recommendations);
      }
    } else {
      maxItem = maxItem + 10;

      cr = await CourseRecommendationServices()
          .getRecommendation(maxItem: maxItem);
      if (cr != null) {
        courseRecomendationList = cr.recommendations;
      }
    }
    notifyListeners();
  }

  void getCourseData({required int courseId}) async {
    if (isLogin) {
      final CourseDetailsModel? response =
          await CoursesService.getCourseDetails(courseId: courseId);
      navigateTo(response!.data);
    } else {
      final CourseDetailsNoLoginModel? response =
          await CoursesService.getCourseDetailsNoLogin(courseId: courseId);
      nonLoginNavigateTo(response!.data);
    }
  }

  void navigateTo(CourseDetailsData courseDetail) {
    if (courseDetail.isSubscription == true) {
      Navigator.pushNamed(
        context!,
        "/kelasscreen",
        arguments: courseDetail,
      );
    } else {
      Navigator.pushNamed(
        context!,
        "/daftarkelas",
        arguments: courseDetail,
      );
    }
  }

  void nonLoginNavigateTo(CourseDetailsNoLoginData data) {
    Navigator.pushNamed(
      context!,
      "/nonloginkelas",
      arguments: data,
    );
  }

  void getRecommendation() async {
    courseRecomendationList.clear();
    SharedPreferences sp = await SharedPreferences.getInstance();
    CourseRecommendation? cr;
    if (sp.getBool(SPKey.isLogged) == null ||
        sp.getBool(SPKey.isLogged) == false) {
      cr = await CourseRecommendationServices().getAllCourse(limit: 10);
    } else {
      cr = await CourseRecommendationServices().getRecommendation(maxItem: 10);
    }
    courseRecomendationList = cr!.recommendations;
    notifyListeners();
  }
}
