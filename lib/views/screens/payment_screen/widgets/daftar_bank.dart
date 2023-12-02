import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../viewmodels/bank_provider.dart';

class DaftarBank extends StatelessWidget {
  const DaftarBank({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BankDataProvider>(
      builder: (context, prov, _) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final bank = prov.bankData[index];
              return Column(
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
            childCount: prov.bankData.length,
          ),
        );
      },
    );
  }
}
