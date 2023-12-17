import 'package:flutter/material.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/widgets/materi_card_lightblue.dart';
import '../../widgets/kelas_widgets/kelas_card_component.dart';

class ListMateriScreen extends StatelessWidget {
  final moduleId;
  const ListMateriScreen({super.key, required this.moduleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios),
                const SizedBox(width: 12),
                Text(
                  'Kelas',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        KelasCard(
                          className: "UI/UX : Becoming Professional",
                          mentorName: "Bagus Adhi Laksana",
                          progress: 65,
                        ),
                        SizedBox(height: 16),
                        MateriCardLightBlue(
                          title: 'Introducing UI/UX Design',
                          description: 'Explain About UI/UX Fundamental',
                          badge: 'Video',
                          progress: 1.0, // Completed
                        ),
                        SizedBox(height: 10),
                        MateriCardLightBlue(
                          title: 'Introducing UI/UX Design',
                          description: 'Explain About UI/UX Fundamental',
                          badge: 'Materi',
                          progress: 1.0, // Completed
                        ),
                        SizedBox(height: 10),
                        MateriCardLightBlue(
                          title: 'Introducing UI/UX Design',
                          description: 'Explain About UI/UX Fundamental',
                          badge: 'Tugas',
                          progress: 1.0, // Completed
                        ),
                        SizedBox(height: 10),
                        MateriCardLightBlue(
                          title: 'Introducing UI/UX Design',
                          description: 'Tenggat : 12 Nov, 23,59 WIB',
                          badge: 'Quiz',
                          progress: 0, // Completed
                        ),
                        SizedBox(height: 10),
                        MateriCardLightBlue(
                          title: 'Introducing UI/UX Design',
                          description:
                              'Tenggat : 12 Nov, 10.00 - 13 Nov, 10.00 WIB',
                          badge: 'Quiz',
                          progress: 0, // Completed
                        ),
                        SizedBox(height: 10),
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
