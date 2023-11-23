import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:harsa_mobile/models/certificate.dart';
import 'package:harsa_mobile/viewmodels/certificate_provider.dart';

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final certificateProvider =
        Provider.of<CertificateProvider>(context, listen: false);

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
                  'Sertifikat',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              focusNode: certificateProvider.focusNode,
              onChanged: (value) {
                certificateProvider.searchCertificate(value);
              },
              decoration: InputDecoration(
                fillColor: Colors.grey[200],
                labelText:
                    certificateProvider.focusNode.hasFocus ? '' : 'Search...',
                filled: true,
                suffixIcon: const Icon(
                  Icons.search,
                  size: 32,
                  color: Colors.grey,
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
            Consumer<CertificateProvider>(
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
                              Certificate certificate =
                                  prov.filteredData[index];
                              return Card(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 8,
                                ),
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Image.network(
                                        certificate.picture,
                                        fit: BoxFit.cover,
                                        height: 145,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              certificate.title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Text(
                                              certificate.subtitle,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    color: Colors.grey,
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
                                'assets/images/sertifikat_kosong.svg',
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Sertifikat tidak ditemukan',
                                style: Theme.of(context).textTheme.titleMedium,
                              )
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
