import 'package:flutter/material.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/views/screens/payment_screen/all_payment_screen.dart';
import 'package:harsa_mobile/views/screens/payment_screen/detail_payment_screen.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/bank_provider.dart';

class PaymentScreen extends StatelessWidget {
  final int price;
  const PaymentScreen({super.key, required this.price});
  final int pajak = 2000;
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
              onTap: () {},
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
      body: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: ColorsPallete.white,
                border: Border.all(color: ColorsPallete.grey, width: 0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Metode Pembayaran',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AllPaymentScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Lihat Semua',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: ColorsPallete.sandyBrown),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Consumer<BankProvider>(
                      builder: (context, prov, _) {
                        return ListView.separated(
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            final bank = prov.bankData[index];
                            return RadioListTile<int>(
                              value: index,
                              groupValue: prov.selectedBankIndex,
                              title: Text(
                                bank.accountType,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              secondary: Image.asset(
                                bank.imagePath,
                                width: 72,
                              ),
                              onChanged: (int? value) {
                                if (value != null) {
                                  prov.selectedBankIndex = value;
                                  prov.selectBank(bank);
                                }
                              },
                              activeColor: ColorsPallete.sandyBrown,
                              controlAffinity: ListTileControlAffinity.trailing,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ringkasan Pembayaran',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Subtotal Tagihan'),
                      Text(
                        'Rp${price - pajak}',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Pajak'),
                      Text(
                        'Rp$pajak',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Tagihan'),
                      Text(
                        'Rp$price',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: ColorsPallete.grey, width: 0.5),
                  color: ColorsPallete.white,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Total Tagihan'),
                      Text(
                        'Rp$price',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      final selectedBank =
                          Provider.of<BankProvider>(context, listen: false)
                              .selectedBank;
                      if (selectedBank != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailPaymentScreen(
                              paymentName: selectedBank.name,
                              accountType: selectedBank.accountType,
                              accountNumber: selectedBank.accountNumber,
                              totalAmount: 'Rp$price',
                              imagePath: selectedBank.imagePath,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("Pilih metode pembayaran terlebih dahulu"),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Bayar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
