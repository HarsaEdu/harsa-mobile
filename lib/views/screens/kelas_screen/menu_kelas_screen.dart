import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harsa_mobile/utils/constants/loading_state.dart';
import 'package:harsa_mobile/viewmodels/menu_kelas_screen_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/kelas_widgets/kelas_card_component.dart';

class MenuKelasScreen extends StatefulWidget {
  const MenuKelasScreen({super.key});

  @override
  State<MenuKelasScreen> createState() => _MenuKelasScreenState();
}

class _MenuKelasScreenState extends State<MenuKelasScreen> {
  @override
  void initState() {
    final provider = Provider.of<MenuKelasProvider>(context, listen: false);
    provider.loadingState = LoadingState.initial;
    provider.getUserCourses(filter: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).padding.top + 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Kelas',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Consumer<MenuKelasProvider>(
                        builder: (context, provider, child) {
                          return SearchBar(
                            controller: provider.searchController,
                            elevation: const MaterialStatePropertyAll(0),
                            side: const MaterialStatePropertyAll(
                              BorderSide(color: Colors.grey, width: 1),
                            ),
                            padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 0,
                              ),
                            ),
                            trailing: <Widget>[
                              PopupMenuButton<String>(
                                constraints: const BoxConstraints.tightFor(
                                    width: 100, height: 110),
                                offset: const Offset(45, -10),
                                color: Colors.white,
                                surfaceTintColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onSelected: (value) {
                                  // Handle filter selection
                                  provider.setFilter(value);
                                },
                                itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry<String>>[
                                  const PopupMenuItem<String>(
                                    enabled: false,
                                    height: 25,
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
                                    height: 25,
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
                                    value: 'progress',
                                    height: 25,
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
                                    height: 25,
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
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: SvgPicture.asset(
                                    'assets/icons/outline/filter.svg',
                                    colorFilter: const ColorFilter.mode(
                                      Colors.black,
                                      BlendMode.srcIn,
                                    ),
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: SvgPicture.asset(
                                  'assets/icons/outline/magnifyingglass.svg',
                                  colorFilter: const ColorFilter.mode(
                                    Colors.grey,
                                    BlendMode.srcIn,
                                  ),
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ],
                            hintText: 'Search...',
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    const CircleAvatar(
                      radius: 20,
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(child: Consumer<MenuKelasProvider>(
            builder: (context, state, _) {
              return state.userCoursesModel != null
                  ? CustomScrollView(
                      slivers: <Widget>[
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(height: 25),
                                for (var course
                                    in state.userCoursesModel?.data ?? [])
                                  Column(
                                    children: <Widget>[
                                      KelasCard(
                                        classImage: course.imageUrl,
                                        className: course.title,
                                        mentorName: course.userIntructur.name,
                                        progress: course.progress,
                                      ),
                                      const SizedBox(height: 16),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height / 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/icons/outline/power_circle.svg",
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            "Belum ada kelas yang kamu daftarkan",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              foregroundColor: const Color(0xFF2A2D34),
                            ),
                            child: const Text(
                              "Daftar Kelas",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    );
            },
          )),
        ],
      ),
    );
  }
}
