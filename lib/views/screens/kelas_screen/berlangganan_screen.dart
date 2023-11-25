import 'package:flutter/material.dart';
import '../../widgets/kelas_widgets/kelas_card_component.dart';
import 'widgets/statistic_card.dart';
import 'widgets/testimoni_card.dart';

class BerlanggananScreen extends StatelessWidget {
  const BerlanggananScreen({super.key});

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
                        const KelasCard(
                          classImage: 'https://picsum.photos/40',
                          className: "UI/UX : Becoming Professional",
                          mentorName: "Bagus Adhi Laksana",
                          button: "Berlangganan Sekarang",
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Deskripsi Kelas',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                        ),
                        const SizedBox(height: 20),
                        const ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage('https://picsum.photos/40'),
                          ),
                          title: Text('Wahyu Nugroho'),
                          subtitle: Text('Universitas Gajah Mada'),
                          contentPadding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            StatisticCard(
                              title: 'Siswa',
                              subtitle: '235',
                              width: MediaQuery.of(context).size.width,
                            ),
                            const SizedBox(width: 12),
                            StatisticCard(
                              title: 'Materi',
                              subtitle: '25',
                              width: MediaQuery.of(context).size.width,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ulasan',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Lainnya',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: TestimoniCard(
                        name: 'Ponyo Sunyopo',
                        timeAgo: '12 h lalu',
                        reviewText:
                            'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu.',
                        rating: 4,
                      ),
                    ),
                    childCount: 3,
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