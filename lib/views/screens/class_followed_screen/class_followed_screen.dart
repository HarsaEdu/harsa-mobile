import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:harsa_mobile/viewmodels/class_followed_provider.dart';
import 'package:harsa_mobile/models/class_followed.dart';

class ClassFollowedScreen extends StatelessWidget {
  const ClassFollowedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final classFollowedProvider =
        Provider.of<ClassFollowedProvider>(context, listen: false);

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
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              focusNode: classFollowedProvider.focusNode,
              onChanged: (value) {
                classFollowedProvider.searchClassFollowed(value);
              },
              decoration: InputDecoration(
                fillColor: Colors.grey[200],
                labelText:
                    classFollowedProvider.focusNode.hasFocus ? '' : 'Search...',
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
            Consumer<ClassFollowedProvider>(
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
                              ClassFollowed classFollowed =
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
                                        classFollowed.picture,
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
                                              classFollowed.title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Text(
                                              classFollowed.subtitle,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
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
