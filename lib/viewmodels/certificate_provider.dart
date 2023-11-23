import 'package:flutter/material.dart';

import 'package:harsa_mobile/models/certificate.dart';

final List<Map<String, Object>> myData = [
  {
    'id': 1,
    'picture':
        'https://blogct.creative-tim.com/blog/content/images/2022/07/UX-design-courses.jpg',
    'title': 'UI/UX: Becoming Professional',
    'subtitle': 'Max Verstappen',
  },
  {
    'id': 2,
    'picture':
        'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20201111215809/How-to-Become-a-Front-End-Developer-in-2020.png',
    'title': 'Front-End: Becoming Professional',
    'subtitle': 'Lando Norris',
  },
  {
    'id': 3,
    'picture':
        'https://assets-global.website-files.com/613baa7ad4f394142e65cb73/6192df82a3ed61da2f44f38a_opengraph-06.jpg',
    'title': 'Back-End: Becoming Professional',
    'subtitle': 'George Russell',
  },
  {
    'id': 4,
    'picture':
        'https://softflew.com/wp-content/uploads/2022/12/Flutter-course-in-lucknow.png',
    'title': 'Flutter: Becoming Professional',
    'subtitle': 'Charles Leclerc',
  },
  {
    'id': 5,
    'picture':
        'https://www.jagoanhosting.com/blog/wp-content/uploads/2022/10/cara-membuat-elearning.jpg',
    'title': 'QE: Becoming Professional',
    'subtitle': 'Esteban Ocon',
  }
];

List<Certificate> getCertificateList() {
  return myData.map((json) => Certificate.fromJson(json)).toList();
}

class CertificateProvider with ChangeNotifier {
  CertificateProvider() {
    focusNode.addListener(notifyListeners);
  }

  final List<Certificate> data = getCertificateList();
  FocusNode focusNode = FocusNode();
  List<Certificate> filteredData = getCertificateList();
  String searchQuery = '';

  void searchCertificate(String query) {
    searchQuery = query;
    if (query.isEmpty) {
      filteredData = data;
    } else {
      filteredData = data.where((certificate) {
        return certificate.title.toLowerCase().contains(query.toLowerCase());
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
