import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/viewmodels/home_screen_provider.dart';
import 'package:harsa_mobile/models/course_recommendation/course_recommend.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeScreenProvider pageProvider;

  @override
  void initState() {
    super.initState();
    pageProvider = Provider.of<HomeScreenProvider>(context, listen: false);
    pageProvider.getRecommendation();
    pageProvider.getSubsPlanList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorsPallete.whiteGrey,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Consumer<HomeScreenProvider>(
                builder: (context, value, child) => Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: SearchBar(
                          controller: value.searchController,
                          elevation: const MaterialStatePropertyAll(0),
                          side: const MaterialStatePropertyAll(
                            BorderSide(color: Colors.grey, width: 1),
                          ),
                          padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 0,
                            ),
                          ),
                          trailing: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: SvgPicture.asset(
                                'assets/icons/outline/magnifyingglass.svg',
                                colorFilter: const ColorFilter.mode(
                                  Colors.grey,
                                  BlendMode.srcIn,
                                ),
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ],
                          hintText: 'Search...',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const CircleAvatar(
                      radius: 20,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider.builder(
                      itemCount: 2,
                      itemBuilder: (context, index, pageIndex) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://images.pexels.com/photos/4443160/pexels-photo-4443160.jpeg?cs=srgb&dl=pexels-polina-tankilevitch-4443160.jpg&fm=jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 220,
                        ),
                      ),
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                        autoPlayInterval: const Duration(seconds: 5),
                        viewportFraction: 1,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kategori',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          InkWell(
                            child: SvgPicture.asset(
                              'assets/icons/outline/chevron_forward.svg',
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/category');
                            },
                          ),
                        ],
                      ),
                    ),
                    Consumer<HomeScreenProvider>(
                      builder: (context, value, child) => GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: value.categoryList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 15,
                          crossAxisCount: 4,
                          crossAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/category');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorsPallete.lightBlueSky,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  value.categoryList[index].icon,
                                  height: 45,
                                  width: 45,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  value.categoryList[index].name,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rekomendasi Kelas',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          InkWell(
                            child: SvgPicture.asset(
                              'assets/icons/outline/chevron_forward.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Consumer<HomeScreenProvider>(
                      builder: (context, value, child) => SizedBox(
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: value.courseRecomendationList.length,
                          itemBuilder: (context, index) {
                            Recommendation recommendation =
                                value.courseRecomendationList[index];
                            return Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              margin: const EdgeInsets.only(right: 26),
                              width: 286,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    recommendation.courseImage,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 125,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 15,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            recommendation.courseTitle,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Text(
                                            recommendation.instructorName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  color: Colors.grey,
                                                ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/filled/rating.svg',
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                recommendation.predictedRating
                                                    .toStringAsFixed(1)
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Paket Berlangganan',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          InkWell(
                            child: SvgPicture.asset(
                              'assets/icons/outline/chevron_forward.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Consumer<HomeScreenProvider>(
                      builder: (context, value, child) => SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: value.subscriptionPlanList.length,
                          itemBuilder: (context, index) {
                            final subsPlan = value.subscriptionPlanList[index];
                            return Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              margin: const EdgeInsets.only(right: 26),
                              width: 290,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    subsPlan.image,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 120,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 18,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            subsPlan.title,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                          Text(
                                            subsPlan.description,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
