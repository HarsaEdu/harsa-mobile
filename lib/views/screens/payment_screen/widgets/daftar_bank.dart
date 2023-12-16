import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../viewmodels/bank_provider.dart';
import '../detail_payment_screen.dart';

class DaftarBank extends StatelessWidget {
  const DaftarBank({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BankProvider>(
      builder: (context, prov, _) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final bank = prov.bankData[index];
              return InkWell(
                onTap: () {
                  prov.selectBank(bank);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailPaymentScreen(
                        paymentName: bank.name,
                        accountType: bank.accountType,
                        accountNumber: bank.accountNumber,
                        totalAmount: 35000,
                        pajak: 3500,
                        imagePath: bank.imagePath,
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Image.asset(
                        bank.imagePath,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            bank.accountType,
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
            childCount: prov.bankData.length,
          ),
        );
      },
    );
  }
}
