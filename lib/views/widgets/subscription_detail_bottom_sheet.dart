import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:harsa_mobile/viewmodels/subscription_plan_list_provider.dart';
import 'package:harsa_mobile/models/subscription_models/subscription_model.dart';

class CustomBottomSheetDialog {
  static void show(BuildContext context, Datum subscription) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Consumer<SubscriptionPlanListProvider>(
          builder: (context, value, child) {
            return CustomBottomSheetContent(subscription: subscription);
          },
        );
      },
    );
  }
}

class CustomBottomSheetContent extends StatelessWidget {
  final Datum subscription;

  const CustomBottomSheetContent({
    Key? key,
    required this.subscription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(9),
              topRight: Radius.circular(9),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Paket Reguler',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Deskripsi',
                style: TextStyle(
                  color: Color(0xFF667084),
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                subscription.description,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Durasi',
                style: TextStyle(
                  color: Color(0xFF667084),
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '${subscription.duration} Hari',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Harga',
                style: TextStyle(
                  color: Color(0xFF667084),
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Rp ${subscription.price}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 18),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/detailsubscription',
                    arguments: subscription,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF092C4C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Langganan Sekarang',
                        style: TextStyle(
                          color: Color(0xFFF6F6F6),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
