import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/views/widgets/subscription_detail_bottom_sheet.dart';
import 'package:harsa_mobile/viewmodels/subscription_plan_list_provider.dart';
import 'package:harsa_mobile/models/subscription_models/subscription_model.dart';

class SubscriptionPlanList extends StatefulWidget {
  const SubscriptionPlanList({super.key});

  @override
  State<SubscriptionPlanList> createState() => _SubscriptionPlanListState();
}

class _SubscriptionPlanListState extends State<SubscriptionPlanList> {
  @override
  void initState() {
    super.initState();
    Provider.of<SubscriptionPlanListProvider>(context, listen: false)
        .loadSubscriptions();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsPallete.whiteGrey,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 16),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(width: 12),
              Text(
                'Paket Berlangganan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
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
                            padding: const EdgeInsets.symmetric(horizontal: 5),
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
            child: Consumer<SubscriptionPlanListProvider>(
              builder: (context, value, child) => ListView.builder(
                itemCount: value.subscriptions.length,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (context, index) {
                  Datum subscription = value.subscriptions[index];

                  return InkWell(
                    onTap: () {
                      CustomBottomSheetDialog.show(context, subscription);
                    },
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 15),
                      width: screenWidth,
                      height: 205,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            subscription.image,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    subscription.title,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  Text(
                                    'Rp ${subscription.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
