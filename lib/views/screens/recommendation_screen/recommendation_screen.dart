import 'package:flutter/material.dart';
import 'package:harsa_mobile/viewmodels/recommendation_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/views/widgets/category_widgets/category_card.dart';

class RecommendationScreen extends StatelessWidget {
  const RecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPallete.whiteGrey,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/outline/chevron_backward.svg',
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {},
                ),
                const Text(
                  'Rekomendasi Kelas',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<RecommendationScreenProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 15.0),
                  itemCount: provider.categories.length,
                  itemBuilder: (context, index) {
                    // return CategoryCard(category: provider.categories[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
