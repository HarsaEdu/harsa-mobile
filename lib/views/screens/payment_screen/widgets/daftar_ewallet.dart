import 'package:flutter/material.dart';
import 'package:harsa_mobile/viewmodels/e_wallet_provider.dart';
import 'package:provider/provider.dart';

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
              return Column(
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
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              );
            },
            childCount: prov.eWalletData.length,
          ),
        );
      },
    );
  }
}
