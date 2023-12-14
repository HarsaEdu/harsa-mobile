import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/payment_provider.dart';
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
  final int pajak = 2000;
  Timer? _timer;
  Duration _timeLeft = const Duration();
  @override
  void initState() {
    super.initState();
    if (widget.paymentStatus == 'success'.toLowerCase()) {
      Future.delayed(
        const Duration(seconds: 1),
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
    } else if (widget.paymentStatus == 'gagal'.toLowerCase()) {
      Future.delayed(
        const Duration(seconds: 1),
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
    WidgetsBinding.instance.addPostFrameCallback((_) => _startTimer());
  }

  void _startTimer() {
    final controller = Provider.of<PaymentProvider>(context, listen: false);
    if (controller.payment != null) {
      DateTime expiredAt = DateTime.parse(controller.payment!.expiryTime);
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        final now = DateTime.now();
        setState(() {
          _timeLeft = expiredAt.difference(now);
          if (_timeLeft.isNegative) {
            _timer?.cancel();
            _timeLeft = Duration.zero;
          }
        });
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hours = _timeLeft.inHours.toString().padLeft(2, '0');
    final minutes = (_timeLeft.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (_timeLeft.inSeconds % 60).toString().padLeft(2, '0');
    final timeString = '$hours : $minutes : $seconds';
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
        child: Consumer<PaymentProvider>(
          builder: (context, prov, _) => Column(
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
                        widget.paymentStatus == 'success'
                            ? 'Pembayaran Berhasil'
                            : widget.paymentStatus == 'pending'
                                ? 'Menunggu Pembayaran'
                                : widget.paymentStatus == 'failure'
                                    ? 'Pembayaran Gagal'
                                    : 'Status Tidak Diketahui',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: widget.paymentStatus == 'success'
                                    ? Colors.green
                                    : widget.paymentStatus == 'pending'
                                        ? Colors.black
                                        : widget.paymentStatus == 'failure'
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
                                  prov.payment!.item.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  DateFormat('EEEE, d MMM yyyy HH.mm', 'id_ID')
                                      .format(DateTime.parse(
                                          prov.payment!.expiryTime)),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(color: ColorsPallete.grey),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: !(widget.paymentStatus == 'success' ||
                                widget.paymentStatus == 'failure'),
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
                                      timeString,
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
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Jenis Paket'),
                              Text(
                                prov.payment!.item.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Atas Nama'),
                              Text(
                                prov.payment!.customer.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total Tagihan'),
                              Text(
                                'Rp${prov.payment!.grossAmount}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Subtotal Tagihan'),
                              Text(
                                'Rp${double.tryParse(prov.payment!.grossAmount)! - pajak}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
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
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total Tagihan'),
                              Text(
                                'Rp${prov.payment!.grossAmount}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
