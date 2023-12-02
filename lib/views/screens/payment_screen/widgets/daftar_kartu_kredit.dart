import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/viewmodels/kartu_kredit_provider.dart';
import 'package:provider/provider.dart';

class DaftarKartuKredit extends StatelessWidget {
  const DaftarKartuKredit({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KartuKreditProvider>(
      builder: (context, prov, _) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final kartuKredit = prov.kartuKreditData[index];
              return Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: SvgPicture.asset(
                      kartuKredit.imagePath,
                      width: 72,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          kartuKredit.accountType,
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
            childCount: prov.kartuKreditData.length,
          ),
        );
      },
    );
  }
}
