import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/viewmodels/subscription_plan_list_provider.dart';
import 'package:provider/provider.dart';

class SubscriptionPlanList extends StatefulWidget {
  const SubscriptionPlanList({super.key});

  @override
  State<SubscriptionPlanList> createState() => _SubscriptionPlanListState();
}

class _SubscriptionPlanListState extends State<SubscriptionPlanList> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsPallete.whiteGrey,
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              width: screenWidth,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chevron_left_outlined),
                  ),
                  Text(
                    'Paket Berlangganan',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Consumer<SubscriptionPlanListProvider>(
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
                    const SizedBox(
                      width: 10,
                    ),
                    const CircleAvatar(
                      radius: 20,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 10,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemBuilder: (context, index) => Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(bottom: 15),
                width: screenWidth,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://cdn.elearningindustry.com/wp-content/uploads/2015/10/6-convincing-reasons-take-elearning-course-800x600.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 120,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Paket Regular Bulanan',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              'Rp 33.000',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
