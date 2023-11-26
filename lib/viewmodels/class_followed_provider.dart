import 'package:flutter/material.dart';

import 'package:harsa_mobile/models/class_followed.dart';

final List<Map<String, Object>> myData = [
  {
    'id': 1,
    'picture':
        'https://blogct.creative-tim.com/blog/content/images/2022/07/UX-design-courses.jpg',
    'title': 'UI/UX: Becoming Professional',
    'subtitle': 'Max Verstappen',
    'status': 'Selesai',
  },
  {
    'id': 2,
    'picture':
        'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20201111215809/How-to-Become-a-Front-End-Developer-in-2020.png',
    'title': 'Front-End: Becoming Professional',
    'subtitle': 'Lando Norris',
    'status': 'Ongoing',
  },
  {
    'id': 3,
    'picture':
        'https://assets-global.website-files.com/613baa7ad4f394142e65cb73/6192df82a3ed61da2f44f38a_opengraph-06.jpg',
    'title': 'Back-End: Becoming Professional',
    'subtitle': 'George Russell',
    'status': 'Baru',
  },
  {
    'id': 4,
    'picture':
        'https://softflew.com/wp-content/uploads/2022/12/Flutter-course-in-lucknow.png',
    'title': 'Flutter: Becoming Professional',
    'subtitle': 'Charles Leclerc',
    'status': 'Ongoing',
  },
  {
    'id': 5,
    'picture':
        'https://www.jagoanhosting.com/blog/wp-content/uploads/2022/10/cara-membuat-elearning.jpg',
    'title': 'QE: Becoming Professional',
    'subtitle': 'Esteban Ocon',
    'status': 'Ongoing',
  }
];

List<ClassFollowed> getClassFollowedList() {
  return myData.map((json) => ClassFollowed.fromJson(json)).toList();
}

class ClassFollowedProvider with ChangeNotifier {
  ClassFollowedProvider() {
    focusNode.addListener(notifyListeners);
  }

  final List<ClassFollowed> data = getClassFollowedList();
  FocusNode focusNode = FocusNode();
  List<ClassFollowed> filteredData = getClassFollowedList();
  String searchQuery = '';

  void filterByStatus(String status) {
    filteredData = data.where((classFollowed) {
      return classFollowed.status.toLowerCase() == status.toLowerCase();
    }).toList();
    notifyListeners();
  }

  void searchClassFollowed(String query) {
    searchQuery = query;
    if (query.isEmpty) {
      filteredData = data;
    } else {
      filteredData = data.where((classFollowed) {
        return classFollowed.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
