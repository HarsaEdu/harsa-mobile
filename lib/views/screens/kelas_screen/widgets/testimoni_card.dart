import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class TestimoniCard extends StatelessWidget {
  final String name;
  final String timeAgo;
  final String reviewText;
  final int rating;

  const TestimoniCard({
    super.key,
    required this.name,
    required this.timeAgo,
    required this.reviewText,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: ColorsPallete
            .prussianBlue, // Replace with actual color from your color palette
        borderRadius: BorderRadius.circular(10),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/40'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' \u2022 ',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        timeAgo,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(height: 4), // You can adjust this space
                  Text(
                    reviewText,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white, overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(height: 12), // Space before the rating stars
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        color: ColorsPallete.sandyBrown,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
