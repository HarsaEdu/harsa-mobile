import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/course_recommendation/course_recommend.dart';
import 'package:harsa_mobile/services/course_recommendation_services.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecommendationScreenProvider extends ChangeNotifier {
  ScrollController scrollController = ScrollController();

  List<Recommendation> courseRecomendationList = [];
  int crOffset = 0;
  int maxItem = 0;

  void onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMore();
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