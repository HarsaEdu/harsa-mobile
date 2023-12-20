// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/category_models/category_content.dart';

import 'package:harsa_mobile/models/category_models/category_home_model.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_model.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_no_login_model.dart';
import 'package:harsa_mobile/models/course_recommendation/course_recommend.dart';
import 'package:harsa_mobile/models/subscription_models/subscription_model.dart';
import 'package:harsa_mobile/services/category_service.dart';
import 'package:harsa_mobile/services/course_recommendation_services.dart';
import 'package:harsa_mobile/services/courses_service.dart';
import 'package:harsa_mobile/services/subscription_service.dart';
import 'package:harsa_mobile/utils/constants/shared_preferences_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenProvider extends ChangeNotifier {
  late final TextEditingController searchController;
  late final FocusNode searchFocusNode;
  bool isLogin = false;

  List<Category> categoryList = [];
  List<Recommendation> courseRecomendationList = [];
  List<Datum> subscriptionPlanList = [];
  List<CategoryListData> checkCategory = [];
  List<CategoryListData> searchResult = [];

  bool isSearching = false;

  late BuildContext context;

  String? searchQuery;

  HomeScreenProvider() {
    searchController = TextEditingController();
    searchFocusNode = FocusNode();
    searchFocusNode.addListener(onSearch);
  }

  void initData() {
    getRecommendation();
    getSubsPlanList();
    getCategories();
    getListCategories();
  }

  void getRecommendation() async {
    courseRecomendationList.clear();
    SharedPreferences sp = await SharedPreferences.getInstance();
    CourseRecommendation? cr;
    print(sp.getBool(SPKey.isLogged));
    if (sp.getBool(SPKey.isLogged) == null ||
        sp.getBool(SPKey.isLogged) == false) {
      isLogin = false;
      cr = await CourseRecommendationServices().getAllCourse(limit: 5);
    } else {
      isLogin = true;
      cr = await CourseRecommendationServices().getRecommendation(maxItem: 5);
    }
    courseRecomendationList = cr!.recommendations;
    notifyListeners();
  }

  void getSubsPlanList() async {
    final subsplan = await SubsService().getSubscriptions(limit: 5);
    subscriptionPlanList = subsplan;
    notifyListeners();
  }

  void getCategories() async {
    final categoryData = await CategoryService().getCategories();
    categoryList = categoryData.categories;
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
    searchController.clear();
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
        return course.courseTitle.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  void onBack(BuildContext context) {
    if (isSearching) {
      searchController.clear();
      searchFocusNode.unfocus();
      isSearching = false;
    }
    notifyListeners();
  }

  void gotoRecommend() {
    Navigator.pushNamed(context, '/recommendation');
  }

  void gotoSubs() {
    Navigator.pushNamed(context, '/subscriptionlist');
  }

  CourseDetailsNoLoginData? noLoginData;

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
        context,
        "/kelasscreen",
        arguments: courseDetail,
      );
    } else {
      Navigator.pushNamed(
        context,
        "/daftarkelas",
        arguments: courseDetail,
      );
    }
  }

  void nonLoginNavigateTo(CourseDetailsNoLoginData data) {
    Navigator.pushNamed(
      context,
      "/nonloginkelas",
      arguments: data,
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }
}
