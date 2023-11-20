import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> categoryList = [
    {
      'name': 'Sosial',
      'icon': 'assets/icons/category_icon/person.3.fill.svg',
    },
    {
      'name': 'Bisnis',
      'icon': 'assets/icons/category_icon/Vector.svg',
    },
    {
      'name': 'Mutimedia',
      'icon': 'assets/icons/category_icon/play.rectangle.on.rectangle.fill.svg'
    },
    {
      'name': 'Jaringan',
      'icon': 'assets/icons/category_icon/Vector-1.svg',
    },
    {
      'name': 'AI',
      'icon':
          'assets/icons/category_icon/rectangles.group.bubble.left.fill.svg',
    },
    {
      'name': 'Desain',
      'icon': 'assets/icons/category_icon/paintpalette_fill.svg',
    },
    {
      'name': 'Komputer',
      'icon': 'assets/icons/category_icon/icon_laptop_computer.svg',
    },
    {
      'name': 'Cyber',
      'icon': 'assets/icons/category_icon/cpu.fill.svg',
    },
  ];

  List courseRecomendationList = [];

  List subscriptionPlanList = [];
}
