import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:harsa_mobile/viewmodels/transaction_history_provider.dart';
import 'package:harsa_mobile/models/payment_models/payment_model.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionHistoryProvider =
        Provider.of<TransactionHistoryProvider>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 16),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(width: 12),
                Text(
                  'Riwayat Transaksi',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              focusNode: transactionHistoryProvider.focusNode,
              onChanged: (value) {
                transactionHistoryProvider.searchTransactionHistory(value);
              },
              decoration: InputDecoration(
                fillColor: Colors.grey[200],
                labelText: transactionHistoryProvider.focusNode.hasFocus
                    ? ''
                    : 'Search...',
                filled: true,
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PopupMenuButton<String>(
                      offset: const Offset(45, -10),
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      icon: const Icon(
                        Icons.filter_alt_outlined,
                        size: 32,
                        color: Colors.grey,
                      ),
                      onSelected: (value) {
                        if (value != 'Filter') {
                          transactionHistoryProvider.filterByStatus(value);
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          enabled: false,
                          height: 40,
                          child: Text(
                            'Filter',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'success',
                          height: 40,
                          child: Text(
                            'Berhasil',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'pending',
                          height: 40,
                          child: Text(
                            'Pending',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'failure',
                          height: 40,
                          child: Text(
                            'Dibatalkan',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.search,
                      size: 32,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
              ),
            ),
            Consumer<TransactionHistoryProvider>(
              builder: (context, prov, _) {
                bool isShow =
                    !prov.focusNode.hasFocus || prov.searchQuery.isNotEmpty;
                bool hasData = prov.filteredData.isNotEmpty;

                return Visibility(
                  visible: isShow,
                  child: hasData
                      ? Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: prov.filteredData.length,
                            itemBuilder: (context, index) {
                              Payment transactionHistory =
                                  prov.filteredData[index];

                              Color containerColor = transactionHistoryProvider
                                  .getStatusColor(transactionHistory.status);
                              Color textColor =
                                  transactionHistoryProvider.getStatusTextColor(
                                      transactionHistory.status);

                              return Card(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 11,
                                    vertical: 12,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: Colors.black.withOpacity(0.2),
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/outline/wallet.pass.svg',
                                          ),
                                          const SizedBox(width: 5),
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Paket langganan',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                '16 Nov 2023',
                                                style: TextStyle(
                                                  color: Color(0xFF667084),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Container(
                                            padding: const EdgeInsets.all(6),
                                            decoration: ShapeDecoration(
                                              color: containerColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  transactionHistory.status,
                                                  style: TextStyle(
                                                    color: textColor,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 1,
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 13),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            transactionHistory.item.name,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          const Text(
                                            'total harga',
                                            style: TextStyle(
                                              color: Color(0xFF667084),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            transactionHistory.grossAmount,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 19),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFF2994A),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Beli Lagi',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 200),
                              SvgPicture.asset(
                                'assets/images/creditcard.svg',
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Transaksi tidak ditemukan',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
