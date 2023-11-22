import 'package:flutter/material.dart';

import 'package:harsa_mobile/models/certificate.dart';

final List<Map<String, Object>> myData = [
  {
    'id': 1,
    'picture':
        'https://cdn.elearningindustry.com/wp-content/uploads/2015/10/6-convincing-reasons-take-elearning-course-800x600.jpg',
    'title': 'UI/UX: Becoming Professional',
    'subtitle': 'Max Verstappen',
  },
  {
    'id': 2,
    'picture':
        'https://cdn.elearningindustry.com/wp-content/uploads/2015/10/6-convincing-reasons-take-elearning-course-800x600.jpg',
    'title': 'Front-End: Becoming Professional',
    'subtitle': 'Lando Norris',
  },
  {
    'id': 3,
    'picture':
        'https://cdn.elearningindustry.com/wp-content/uploads/2015/10/6-convincing-reasons-take-elearning-course-800x600.jpg',
    'title': 'Back-End: Becoming Professional',
    'subtitle': 'George Russell',
  },
  {
    'id': 4,
    'picture':
        'https://cdn.elearningindustry.com/wp-content/uploads/2015/10/6-convincing-reasons-take-elearning-course-800x600.jpg',
    'title': 'Flutter: Becoming Professional',
    'subtitle': 'Charles Leclerc',
  },
  {
    'id': 5,
    'picture':
        'https://cdn.elearningindustry.com/wp-content/uploads/2015/10/6-convincing-reasons-take-elearning-course-800x600.jpg',
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
  List<Certificate> searchResults = getCertificateList();
  String searchQuery = '';

  void searchCertificate(String query) {
    searchQuery = query;
    if (query.isEmpty) {
      filteredData = data;
    } else {
      filteredData = data.where((faq) {
        return faq.title.toLowerCase().contains(query.toLowerCase());
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
