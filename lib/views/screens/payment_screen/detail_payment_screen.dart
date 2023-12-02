import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/views/screens/payment_screen/status_payment_screen.dart';

class DetailPaymentScreen extends StatelessWidget {
  final String paymentName;
  final String accountType;
  final String accountNumber;
  final String totalAmount;
  final String imagePath;

  const DetailPaymentScreen({
    super.key,
    required this.paymentName,
    required this.accountType,
    required this.accountNumber,
    required this.totalAmount,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPallete.whiteGrey,
      appBar: AppBar(
        backgroundColor: ColorsPallete.whiteGrey,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(Icons.arrow_back_ios),
            ),
            const SizedBox(width: 10),
            Text(
              'Pembayaran',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: ColorsPallete.white,
                border: Border.all(color: ColorsPallete.grey, width: 0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Batas Akhir Pembayaran',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(color: ColorsPallete.grey),
                            ),
                            Text(
                              'Minggu, 19 Nov 2023 18.00',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
                          decoration: BoxDecoration(
                              color: ColorsPallete.lightRed,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/filled/clock_fill.svg',
                                colorFilter: const ColorFilter.mode(
                                    ColorsPallete.white, BlendMode.srcIn),
                              ),
                              Text(
                                '23 : 58 : 48',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: ColorsPallete.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      leading: Image.asset(imagePath),
                      title: Text(
                        accountType,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(accountNumber),
                    ),
                    const Divider(),
                    const SizedBox(height: 24),
                    const Text(
                      'Nomor Virtual Account',
                      style: TextStyle(color: ColorsPallete.grey),
                    ),
                    Text(
                      accountNumber,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 24),
                    const Text(
                      'Total Pembayaran',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      totalAmount,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Beli Paket Lagi'),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        side: const BorderSide(
                            color: ColorsPallete.sandyBrown, width: 1),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => StatusPaymentScreen(
                              paymentName: paymentName,
                              accountType: accountType,
                              accountNumber: accountNumber,
                              totalAmount: totalAmount,
                              imagePath: imagePath,
                              paymentStatus: 'Pembayaran Berhasil',
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Cek Status Pembayaran',
                        style: TextStyle(color: ColorsPallete.sandyBrown),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
