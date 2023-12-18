import 'package:flutter/material.dart';
import 'package:harsa_mobile/views/screens/kelas_screen/widgets/materi_card_lightblue.dart';
import '../../widgets/kelas_widgets/kelas_card_component.dart';

class ListMateriScreen extends StatelessWidget {
  final int moduleId;
  final String title;
  final String instructur;
  final double progress;
  const ListMateriScreen({
    super.key,
    required this.moduleId,
    required this.title,
    required this.instructur,
    required this.progress,
  });

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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
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
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        KelasCard(
                          className: title,
                          mentorName: instructur,
                          progress: 65,
                        ),
                        const SizedBox(height: 16),
                        const MateriCardLightBlue(
                          title: "Don't Be A Programmer",
                          description: 'lorem ipsum',
                          badge: 'Video',
                          progress: 1.0, // Completed
                        ),
                        const SizedBox(height: 10),
                        const MateriCardLightBlue(
                          title: 'Introducing UI/UX Design',
                          description: 'Explain About UI/UX Fundamental',
                          badge: 'Materi',
                          progress: 1.0, // Completed
                        ),
                        const SizedBox(height: 10),
                        const MateriCardLightBlue(
                          title: 'Introducing UI/UX Design',
                          description: 'Explain About UI/UX Fundamental',
                          badge: 'Tugas',
                          progress: 1.0, // Completed
                        ),
                        const SizedBox(height: 10),
                        const MateriCardLightBlue(
                          title: 'Introducing UI/UX Design',
                          description: 'Tenggat : 12 Nov, 23,59 WIB',
                          badge: 'Quiz',
                          progress: 0, // Completed
                        ),
                        const SizedBox(height: 10),
                        const MateriCardLightBlue(
                          title: 'Introducing UI/UX Design',
                          description:
                              'Tenggat : 12 Nov, 10.00 - 13 Nov, 10.00 WIB',
                          badge: 'Quiz',
                          progress: 0, // Completed
                        ),
                        const SizedBox(height: 10),
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
