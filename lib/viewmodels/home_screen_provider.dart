// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/category_models/category_content.dart';

import 'package:harsa_mobile/models/category_models/category_home_model.dart';
import 'package:harsa_mobile/models/course_recommendation/course_recommend.dart';
import 'package:harsa_mobile/models/subscription_models/subscription_model.dart';
import 'package:harsa_mobile/services/category_service.dart';
import 'package:harsa_mobile/services/course_recommendation_services.dart';
import 'package:harsa_mobile/services/subscription_service.dart';

class HomeScreenProvider extends ChangeNotifier {
  late final TextEditingController searchController;
  late final FocusNode searchFocusNode;

  List<CategoryData> categoryList = [];
  List<Recommendation> courseRecomendationList = [];
  List<Datum> subscriptionPlanList = [];
  List<CategoryListData> checkCategory = [];
  List<CategoryListData> searchResult = [];

  bool isSearching = false;

  String? searchQuery;

  HomeScreenProvider() {
    searchController = TextEditingController();
    searchFocusNode = FocusNode();
    searchFocusNode.addListener(onSearch);
    getRecommendation();
    getSubsPlanList();
    getCategories();
    getListCategories();
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

  void getListCategories() async {
    final categoryData = await CategoryService().getListCategories();
    checkCategory = categoryData.data;
    notifyListeners();
  }

  void onSearch() {
    isSearching = true;
    print(isSearching);
    notifyListeners();
  }

  void onCancelSearch() {
    searchFocusNode.unfocus();
    isSearching = false;
    print(isSearching);
    notifyListeners();
  }

  void tapSuggestion({required String value}) {
    searchController.text = value;
    searchCourse(value);
    notifyListeners();
  }

  void searchCourse(String? query) {
    searchQuery = query;
    if (query == null || query.isEmpty) {
      searchResult = checkCategory;
    } else {
      searchResult = checkCategory.where((course) {
        return course.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  void onBack(BuildContext context) {
    if (isSearching) {
      searchFocusNode.unfocus();
      isSearching = false;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }
}
