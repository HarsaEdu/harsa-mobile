import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'widgets/payment_dialog.dart';

class StatusPaymentScreen extends StatefulWidget {
  final String paymentName;
  final String accountType;
  final String accountNumber;
  final String totalAmount;
  final String imagePath;
  final String paymentStatus;

  const StatusPaymentScreen({
    super.key,
    required this.paymentName,
    required this.accountType,
    required this.accountNumber,
    required this.totalAmount,
    required this.imagePath,
    required this.paymentStatus,
  });

  @override
  State<StatusPaymentScreen> createState() => _StatusPaymentScreenState();
}

class _StatusPaymentScreenState extends State<StatusPaymentScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.paymentStatus == 'Pembayaran Berhasil') {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          if (mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => const PaymentDialog(
                    title: 'Pembayaran Berhasil',
                    content: 'Selamat menikmati layanan harsa.edu',
                    iconPath: 'assets/icons/filled/checklist.svg'),
              ),
            );
          }
        },
      );
    } else if (widget.paymentStatus == 'Pembayaran Gagal') {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          if (mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => const PaymentDialog(
                    title: 'Pembayaran Gagal',
                    content: 'Pembayaran gagal, coba ulangi lagi',
                    iconPath: 'assets/icons/filled/cross.svg'),
              ),
            );
          }
        },
      );
    }
  }

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
              'Status Pembayaran',
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
                    Text(
                      widget.paymentStatus,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: widget.paymentStatus == 'Pembayaran Berhasil'
                              ? Colors.green
                              : widget.paymentStatus == 'Menunggu Pembayaran'
                                  ? Colors.black
                                  : widget.paymentStatus == 'Pembayaran Gagal'
                                      ? Colors.red
                                      : Colors.black // Warna default
                          ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/icon_harsa.png'),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Paket Reguler',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '19 Nov 2023',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: ColorsPallete.grey),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible:
                              !(widget.paymentStatus == 'Pembayaran Berhasil' ||
                                  widget.paymentStatus == 'Pembayaran Gagal'),
                          child: Column(
                            children: [
                              Text(
                                'Bayar Sebelum',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: ColorsPallete.grey),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/filled/clock_fill.svg',
                                    colorFilter: const ColorFilter.mode(
                                        ColorsPallete.sandyBrown,
                                        BlendMode.srcIn),
                                  ),
                                  Text(
                                    '23 : 58 : 48',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                            color: ColorsPallete.sandyBrown),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 16),
                    ListTile(
                      leading: Image.asset(widget.imagePath),
                      title: Text(
                        widget.accountType,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(widget.accountNumber),
                    ),
                    const Divider(),
                    const SizedBox(height: 24),
                    const Text(
                      'Detail Paket',
                      style: TextStyle(color: ColorsPallete.grey),
                    ),
                    const SizedBox(height: 8),
                    const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Jenis Paket'),
                            Text(
                              'Paket Regular Bulanan',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Atas Nama'),
                            Text(
                              'Darma Fauzan W.',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Tagihan'),
                            Text(
                              'Rp33.000',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 24),
                    const Text(
                      'Detail Pembayaran',
                      style: TextStyle(color: ColorsPallete.grey),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Subtotal Tagihan'),
                            Text(
                              'Rp33.000',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Pajak'),
                            Text(
                              'Rp2.000',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total Tagihan'),
                            Text(
                              widget.totalAmount,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
