import 'package:flutter/material.dart';
import 'package:harsa_mobile/viewmodels/payment_card_provider.dart';
import 'package:provider/provider.dart';
import '../detail_payment_screen.dart';

class DaftarPaymentCard extends StatelessWidget {
  const DaftarPaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentCardProvider>(
      builder: (context, prov, _) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final creditCard = prov.paymentCardData[index];
              return InkWell(
                onTap: () {
                  prov.selectPaymentCard(creditCard);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailPaymentScreen(
                        paymentName: creditCard.name,
                        accountType: creditCard.accountType,
                        accountNumber: creditCard.accountNumber,
                        totalAmount: 35000,
                        pajak: 3500,
                        imagePath: creditCard.imagePath,
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Image.asset(
                        creditCard.imagePath,
                        width: 72,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            creditCard.accountType,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 16),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              );
            },
            childCount: prov.paymentCardData.length,
          ),
        );
      },
    );
  }
}
