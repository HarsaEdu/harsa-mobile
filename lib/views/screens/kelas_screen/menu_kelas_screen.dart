import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harsa_mobile/viewmodels/menu_kelas_screen_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/kelas_widgets/kelas_card_component.dart';

class MenuKelasScreen extends StatelessWidget {
  const MenuKelasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  children: [
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
                            trailing: [
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
                                    value: 'Selesai',
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
                                    value: 'Ongoing',
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
                                    value: 'Baru',
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
          const Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 25),
                        KelasCard(
                          classImage: 'https://picsum.photos/40',
                          className: "UI/UX : Becoming Professional",
                          mentorName: "Bagus Adhi Laksana",
                          progress: 65,
                        ),
                        SizedBox(height: 16),
                        KelasCard(
                          classImage: 'https://picsum.photos/40',
                          className: "UI/UX : Becoming Professional",
                          mentorName: "Bagus Adhi Laksana",
                          progress: 65,
                        ),
                        SizedBox(height: 10),
                        KelasCard(
                          classImage: 'https://picsum.photos/40',
                          className: "UI/UX : Becoming Professional",
                          mentorName: "Bagus Adhi Laksana",
                          progress: 65,
                        ),
                        SizedBox(height: 10),
                        KelasCard(
                          classImage: 'https://picsum.photos/40',
                          className: "UI/UX : Becoming Professional",
                          mentorName: "Bagus Adhi Laksana",
                          progress: 65,
                        ),
                        SizedBox(height: 10),
                        KelasCard(
                          classImage: 'https://picsum.photos/40',
                          className: "UI/UX : Becoming Professional",
                          mentorName: "Bagus Adhi Laksana",
                          progress: 65,
                        ),
                        SizedBox(height: 10),
                        KelasCard(
                          classImage: 'https://picsum.photos/40',
                          className: "UI/UX : Becoming Professional",
                          mentorName: "Bagus Adhi Laksana",
                          progress: 65,
                        ),
                        SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
