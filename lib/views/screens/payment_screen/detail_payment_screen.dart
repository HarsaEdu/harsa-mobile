import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';
import 'package:harsa_mobile/viewmodels/payment_provider.dart';
import 'package:harsa_mobile/views/screens/payment_screen/status_payment_screen.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DetailPaymentScreen extends StatefulWidget {
  final String paymentName;
  final String accountType;
  final String accountNumber;
  final int pajak;
  final int totalAmount;
  final String imagePath;

  const DetailPaymentScreen({
    super.key,
    required this.paymentName,
    required this.accountType,
    required this.accountNumber,
    required this.pajak,
    required this.totalAmount,
    required this.imagePath,
  });

  @override
  State<DetailPaymentScreen> createState() => _DetailPaymentScreenState();
}

class _DetailPaymentScreenState extends State<DetailPaymentScreen> {
  Timer? _timer;
  Duration _timeLeft = const Duration();

  @override
  void initState() {
    super.initState();
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
        child: Consumer<PaymentProvider>(
          builder: (context, prov, _) {
            if (prov.payment == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
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
                                  DateFormat('EEEE, d MMM yyyy HH.mm', 'id_ID')
                                      .format(DateTime.parse(
                                          prov.payment!.expiryTime)),
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
                                    timeString,
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
                          leading: Image.asset(widget.imagePath),
                          title: Text(
                            widget.accountType,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(prov.payment!.vaNumber),
                        ),
                        const Divider(),
                        const SizedBox(height: 24),
                        const Text(
                          'Nomor Virtual Account',
                          style: TextStyle(color: ColorsPallete.grey),
                        ),
                        Text(
                          prov.payment!.vaNumber,
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
                          'Rp${widget.totalAmount}',
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
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed('/subscriptionlist');
                          },
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
                                  paymentName: widget.paymentName,
                                  accountType: widget.accountType,
                                  accountNumber: prov.payment!.vaNumber,
                                  pajak : widget.pajak,
                                  totalAmount: widget.totalAmount,
                                  imagePath: widget.imagePath,
                                  paymentStatus: prov.payment!.status,
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
            );
          },
        ),
      ),
    );
  }
}
