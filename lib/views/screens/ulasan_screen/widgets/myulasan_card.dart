// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harsa_mobile/models/classes_models.dart/course_details_model.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/viewmodels/kelas_provider.dart';
import 'package:provider/provider.dart';

class MyUlasanCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String timeAgo;
  final String reviewText;
  final int rating;
  final CourseDetailsData? course;

  const MyUlasanCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.timeAgo,
    required this.reviewText,
    required this.rating,
    this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
                radius: (42 / 2),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Consumer<KelasProvider>(
                  builder: (context, kelasProvider, _) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Container(
                                width: 3.0,
                                height: 3.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorsPallete.lightRed,
                                ),
                              ),
                            ),
                            Text(
                              ' $timeAgo',
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          reviewText,
                          style: const TextStyle(fontSize: 12.0),
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            children: [
                              Row(
                                children: List.generate(5, (index) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 3.0),
                                    child: SvgPicture.asset(
                                      index < rating
                                          ? 'assets/icons/filled/rating.svg'
                                          : 'assets/icons/filled/non_rating.svg',
                                      color: index < rating
                                          ? Colors.amber
                                          : Colors.grey,
                                      width: 16,
                                      height: 14,
                                    ),
                                  );
                                }),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      'assets/icons/outline/square_and_pencil.svg',
                                      width: 24,
                                      height: 24,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      kelasProvider.editMyFeedback();
                                    },
                                  ),
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      'assets/icons/outline/trash.svg',
                                      width: 24,
                                      height: 24,
                                      color: Colors.black,
                                    ),
                                    onPressed: () =>
                                        kelasProvider.deleteMyFeedback(
                                      courseId: course?.course.id ?? 0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
