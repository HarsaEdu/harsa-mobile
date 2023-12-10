import 'package:flutter/material.dart';
import 'package:harsa_mobile/viewmodels/e_wallet_provider.dart';
import 'package:provider/provider.dart';
import '../detail_payment_screen.dart';

class DaftarEWallet extends StatelessWidget {
  const DaftarEWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EWalletProvider>(
      builder: (context, prov, _) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final ewallet = prov.eWalletData[index];
              return InkWell(
                onTap: () {
                  prov.selectEWallet(ewallet);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailPaymentScreen(
                        paymentName: ewallet.name,
                        accountType: ewallet.accountType,

                        totalAmount: 'Rp35.000',
                        imagePath: ewallet.imagePath,
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Image.asset(
                        ewallet.imagePath,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            ewallet.name,
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
            childCount: prov.eWalletData.length,
          ),
        );
      },
    );
  }
}
