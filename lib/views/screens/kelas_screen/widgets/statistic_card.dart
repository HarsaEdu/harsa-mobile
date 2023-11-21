import 'package:flutter/material.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';

class StatisticCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double width;

  const StatisticCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.38,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: ColorsPallete.lightBlueSky,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
