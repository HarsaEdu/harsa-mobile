import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:harsa_mobile/viewmodels/class_followed_provider.dart';
import 'package:harsa_mobile/models/classes_models.dart/user_courses_model.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';
import 'package:harsa_mobile/utils/constants/colors.dart';

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
                  'Kelas Yang Diikuti',
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
                          classFollowedProvider.filterByStatus(value);
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
                          value: 'completed',
                          height: 40,
                          child: Text(
                            'Selesai',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'in progress',
                          height: 40,
                          child: Text(
                            'Ongoing',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: '',
                          height: 40,
                          child: Text(
                            'Baru',
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
            Consumer<ClassFollowedProvider>(
              builder: (context, prov, _) {
                bool isShow =
                    !prov.focusNode.hasFocus || prov.searchQuery.isNotEmpty;
                bool hasData = prov.filteredData.isNotEmpty;

                return Visibility(
                  visible: isShow,
                  child: prov.loadingState == LoadingState.loading
                      ? const Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: ColorsPallete.sandyBrown,
                            ),
                          ),
                        )
                      : hasData
                          ? Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: prov.filteredData.length,
                                itemBuilder: (context, index) {
                                  UserCoursesData classFollowed =
                                      prov.filteredData[index];
                                  return GestureDetector(
                                    onTap: () {
                                      prov.tapCourse(
                                        context,
                                        courseId:
                                            prov.filteredData[index].courseId,
                                      );
                                    },
                                    child: Card(
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
                                              classFollowed.imageUrl,
                                              fit: BoxFit.cover,
                                              height: 145,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    classFollowed.title,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  Text(
                                                    classFollowed
                                                        .intructur.name,
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
                                    ),
                                  );
                                },
                              ),
                            )
                          : Expanded(
                              child: Center(
                                child: ListView(
                                  children: [
                                    const SizedBox(height: 200),
                                    SvgPicture.asset(
                                      'assets/images/sertifikat_kosong.svg',
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      'Kelas tidak ditemukan',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
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
