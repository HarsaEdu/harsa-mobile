// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:harsa_mobile/models/category_models/category_home_model.dart';
import 'package:harsa_mobile/models/course_recommendation/course_recommend.dart';
import 'package:harsa_mobile/models/subscription_models/subscription_model.dart';
import 'package:harsa_mobile/services/category_service.dart';
import 'package:harsa_mobile/services/course_recommendation_services.dart';
import 'package:harsa_mobile/services/subscription_service.dart';

class HomeScreenProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();

  List<CategoryData> categoryList = [];

  List<Recommendation> courseRecomendationList = [];

  List<Datum> subscriptionPlanList = [];

  HomeScreenProvider() {
    getRecommendation();
    getSubsPlanList();
    getCategories();
  }

  void getRecommendation() async {
    CourseRecommendation? cr =
        await CourseRecommendationServices().getRecommendation(maxItem: 5);
    courseRecomendationList = cr!.recommendations;
    notifyListeners();
  }

  void getSubsPlanList() async {
    final subsplan = await SubsService().getSubscriptions();
    subscriptionPlanList = subsplan;
    notifyListeners();
  }

  void getCategories() async {
    final categoryData = await CategoryService().getCategories();
    categoryList = categoryData.data;
    notifyListeners();
  }
}
