import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/course_recommendation/course_recommend.dart';
import 'package:harsa_mobile/viewmodels/recommendation_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({super.key});

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  late RecommendationScreenProvider pageProvider;

  @override
  void initState() {
    super.initState();

    pageProvider =
        Provider.of<RecommendationScreenProvider>(context, listen: false);

    pageProvider.getRecommendation();
    pageProvider.addListener(pageProvider.onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPallete.whiteGrey,
      body: SafeArea(
        child: Consumer<RecommendationScreenProvider>(
          builder: (context, value, child) => Column(
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
                child: ListView.builder(
                  controller: pageProvider.scrollController,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 15.0),
                  itemCount: value.courseRecomendationList.length,
                  itemBuilder: (context, index) {
                    final Recommendation rc =
                        value.courseRecomendationList[index];
                    return Card(
                      margin: const EdgeInsets.all(10),
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 110,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 224, 221, 221),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              image: DecorationImage(
                                image: NetworkImage(rc.courseImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 12.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    rc.courseTitle,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    rc.instructorName,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/filled/rating.svg',
                                        width: 16,
                                        height: 14,
                                        colorFilter: const ColorFilter.mode(
                                          ColorsPallete.sandyBrown,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        rc.predictedRating.toStringAsFixed(1),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
